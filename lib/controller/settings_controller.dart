import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:inst_pay/core/utils/string_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  String currentlocale = 'ar';

  Future<String> loadLocale() async {
    final sp = await SharedPreferences.getInstance();
    currentlocale = sp.getString(StringConst.SP_LANGUAGE_KEY) ?? 'fr';

    update();

    return currentlocale;
  }

  void setLocal(String value) {
    currentlocale = value;
    update();
  }

  Future<void> saveLocale(String locale) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(StringConst.SP_LANGUAGE_KEY, locale);

    currentlocale = locale;
    update();
  }
}
