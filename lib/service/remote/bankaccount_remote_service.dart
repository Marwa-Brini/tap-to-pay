import 'package:dio/dio.dart';
import 'package:inst_pay/core/error/exception/custom_exception.dart';
import 'package:inst_pay/core/utils/api_const.dart';

class BankAccountRemoteService {
  static Future registreBankAccount({
    required String bankUrl,
    required String rib,
  }) async {
    try {
      // print('status: ${bankUrl}');

      final response = await Dio().post(
        "$bankUrl${ApiConst.registreBankAccount}",
        data: rib,
        options: Options(
          headers: {
            'Content-Type': 'text/plain', // Set content type to plain text
          },
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        return;
      } else if (response.statusCode == 404) {
        throw DataNotFoundException(); // 404
      } else {
        throw ServerException();
      } // 500
      // print('status: ${response.statusCode}');
      // print(response.data);
    } catch (e) {
      rethrow;
      // print('status: error ${e.toString()}');
      // print(e.toString());
    }
  }
}
