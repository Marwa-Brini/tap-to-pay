import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inst_pay/core/error/exception/custom_exception.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/model/bank_account_model.dart';
import 'package:inst_pay/service/local/bank_account_service.dart';
import 'package:inst_pay/service/remote/bankaccount_remote_service.dart';

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

  Future deleteBankAccounts(int id) async {
    try {
      await BankAccountService.deleteBankAccount(id);
      bankAccountList.removeWhere((e) => e.id == id);
      update();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> linkAccount({
    required String bankUrl,
    required String rib,
  }) async {
    try {
      await BankAccountRemoteService.registreBankAccount(
        bankUrl: bankUrl,
        rib: rib,
      );
      ;
    } on ServerException catch (_) {
      Fluttertoast.showToast(
        msg: "server exception",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.secondary,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } on DataNotFoundException catch (_) {
      Fluttertoast.showToast(
        msg: "This RIB is not linked to any account",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
