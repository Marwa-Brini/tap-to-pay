import 'package:get/get.dart';
import 'package:inst_pay/model/bank_account_model.dart';
import 'package:inst_pay/service/bank_account_service.dart';

class BankController extends GetxController {
  List<BankAccountModel> bankAccountList = [];
  String qrPayload = '';
  BankAccountModel? selectedAccount;

  Future<void> createBankAccount(
    String rib,
    String? tel,
    String? email,
    int userid,
    double balance,
    String name,
    String? image,
  ) async {
    try {
      await BankAccountService.createBankAccount(
        bankId: int.parse(rib.substring(0, 2)),
        rib: rib,
        tel: tel,
        email: email,
        balance: balance,
        username: name,
      );
      await getBankAccounts();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<BankAccountModel>?> getBankAccounts() async {
    try {
      bankAccountList = await BankAccountService.getBankAccounts();
      if (bankAccountList.isNotEmpty) {
        selectedAccount = bankAccountList[0];
      }
      return bankAccountList;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
