import 'package:get/get.dart';
import 'package:inst_pay/model/user_model.dart';
import 'package:inst_pay/service/user_service.dart';

class AuthenticationController extends GetxController {
  String pinInput = '';
  String newPinInput = '';
  String confirmPinInput = '';
  UserModel? currentUser;

  final keys =
      List<String>.generate(9, (i) => '${i + 1}') +
      ['', '0', '⌫']; // '' for spacing, '⌫' for backspace

  addToPin(String v) {
    pinInput += v;
    update();
  }

  deleteFromPin() {
    pinInput = pinInput.substring(0, pinInput.length - 1);
    update();
  }

  addToNewPin(String v) {
    newPinInput += v;
    update();
  }

  deleteFromNewPin() {
    pinInput = pinInput.substring(0, newPinInput.length - 1);
    update();
  }

  addToConfirmPin(String v) {
    confirmPinInput += v;
    update();
  }

  deleteFromConfirmPin() {
    pinInput = pinInput.substring(0, confirmPinInput.length - 1);
    update();
  }

  resetPin() {
    pinInput = '';
    newPinInput = '';
    confirmPinInput = '';
    update();
  }

  Future<void> createUser(int pin) async {
    try {
      await UserService.createUser(null, null, null, pin);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserModel?> getUser() async {
    try {
      currentUser = await UserService.getUser();
      return currentUser;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  void onInit() async {
    await getUser();
    super.onInit();
  }
}
