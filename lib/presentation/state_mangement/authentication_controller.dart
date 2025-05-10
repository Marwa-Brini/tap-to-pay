import 'package:get/get.dart';
import 'package:inst_pay/core/utils/string_const.dart';

class AuthenticationController extends GetxController {
  bool termsAccepted = false;

  void aceptTerms(bool v) {
    termsAccepted = v;
    update([ControllerID.TERMS_AND_CONDITIONS]);
  }

  Future createAccount() async {}
}
