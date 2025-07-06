import 'package:get/get.dart';
import 'package:inst_pay/model/bank_account_model.dart';
import 'package:inst_pay/service/bank_account_service.dart';

class BankAccountController extends GetxController {
  List<BankAccountModel> bankAccountList = [];

  Future<void> createBankAccount({
    required int bankId,
    required String rib,
    String? tel,
    String? email,
    required double balance,
    required username,
  }) async {
    try {
      await BankAccountService.createBankAccount(
        bankId: bankId,
        rib: rib,
        tel: tel,
        email: email,
        balance: balance,
        username: username,
      );
      await getBankAccounts();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<BankAccountModel>?> getBankAccounts() async {
    try {
      bankAccountList = await BankAccountService.getBankAccounts();
      return bankAccountList;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
