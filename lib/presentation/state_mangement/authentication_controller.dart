import 'package:get/get.dart';
import 'package:inst_pay/core/utils/string_const.dart';

class AuthenticationController extends GetxController {
  bool termsAccepted = false;
  String pinInput = '';
  final keys =
      List<String>.generate(9, (i) => '${i + 1}') +
      ['', '0', '⌫']; // '' for spacing, '⌫' for backspace

  addToPin(String v) {
    pinInput += v;
    print('key add $pinInput');
    update();
  }

  deleteFromPin() {
    pinInput = pinInput.substring(0, pinInput.length - 1);
    print('key del $pinInput');

    update();
  }

  resetPin() {
    pinInput = '';
    update();
  }

  void aceptTerms(bool v) {
    termsAccepted = v;
    update([ControllerID.TERMS_AND_CONDITIONS]);
  }

  Future createAccount() async {}
}
