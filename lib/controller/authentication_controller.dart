import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inst_pay/model/user_model.dart';
import 'package:inst_pay/service/local/user_service.dart';
import 'package:local_auth/local_auth.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AuthenticationController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  File? cachedImage;
  bool isAuthenticated = false;
  String pinInput = '';
  String newPinInput = '';
  String confirmPinInput = '';
  UserModel? currentUser;

  Future<bool> authenticate() async {
    final isSupported = await auth.isDeviceSupported();
    final canCheck = await auth.canCheckBiometrics;

    if (!isSupported || !canCheck) {
      isAuthenticated = false;
      throw Exception('Biometric authentication is not supported');
    }

    try {
      final ok = await auth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      isAuthenticated = ok;
      return ok;
    } catch (e) {
      rethrow;
    }
  }

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
      await UserService.createUser(null, null, null, pin, null);
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

  Future<void> pickAndSaveImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = basename(pickedFile.path);
      final File savedImage = File('${appDir.path}/$fileName');

      await File(pickedFile.path).copy(savedImage.path);

      cachedImage = savedImage;
      await UserService.updateUserImage(cachedImage!.path);
      currentUser!.image = cachedImage!.path;
      update();
    }
  }

  Future<void> loadCachedImage() async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final List<FileSystemEntity> files = appDir.listSync();

    if (files.isNotEmpty) {
      // Optional: filter by image file type
      final imageFile = files.firstWhere(
        (file) => file.path.endsWith('.jpg') || file.path.endsWith('.png'),
        orElse: () => File(''),
      );

      if (imageFile.path.isNotEmpty) {
        cachedImage = File(imageFile.path);
        update();
      }
    }
  }
}
