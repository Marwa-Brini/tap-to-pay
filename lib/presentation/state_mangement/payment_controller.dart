import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PaymentController extends GetxController {
  File? selectedImage;

  Future<void> pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      update(); // to rebuild widgets using GetBuilder
    } else {
      Get.snackbar("Error", "No image selected");
    }
  }
}
