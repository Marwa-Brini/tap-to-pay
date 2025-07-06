import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:inst_pay/model/bank.dart';

class BankController extends GetxController {
  BankModel? selectedbank;
  void selectBank(BankModel? bank) {
    selectedbank = bank;
    update();
  }

  Future<void> fetchData(String url) async {
    final res = await Dio().get(url);
    List<dynamic> data = res.data;
    print(data);
  }
}
