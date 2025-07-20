import 'package:dio/dio.dart';
import 'package:inst_pay/core/utils/api_const.dart';

class BankAccountRemoteService {
  final dio = Dio();
  Future registreBankAccount({
    required String bankUrl,
    required String rib,
  }) async {
    await dio.post("$bankUrl${ApiConst.registreBankAccount}", data: rib);
  }
}
