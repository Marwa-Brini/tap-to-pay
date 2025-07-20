import 'package:inst_pay/service/local/db_service.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/bank_account_model.dart';

class BankAccountService {
  static Future<void> createBankAccountTable(Database database) async {
    await database.execute('''

  CREATE TABLE bankaccount (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT,
    bankId INTEGER,
    username TEXT,
    rib TEXT,
    balance DOUBLE,
    phone TEXT,
    FOREIGN KEY (bankId) REFERENCES bank(id) ON DELETE CASCADE
  )

''');
  }

  static Future<int> createBankAccount({
    required int bankId,
    required String rib,
    String? tel,
    String? email,
    required double balance,
    required String username,
  }) async {
    final db = await DbService.db();
    final data = {
      'bankId': bankId,
      'rib': rib,
      'email': email,
      'phone': tel,
      'username': username,
      'balance': balance,
    };
    final id = await db.insert(
      'bankaccount',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<BankAccountModel>> getBankAccounts() async {
    final db = await DbService.db();
    //final res = await db.query('bankaccount', orderBy: "id");
    final res = await db.rawQuery('''
  SELECT bankaccount.*, bank.image,bank.name
  FROM bankaccount
  INNER JOIN bank ON bankaccount.bankId = bank.id
''');
    if (res.isEmpty) {
      return [];
    }
    print('bankaccount : ${res.toString()}');
    return res.map((e) => BankAccountModel.fromJson(e)).toList();
  }

  static Future<void> deleteBankAccount(int id) async {
    final db = await DbService.db();
    await db.delete('bankaccount', where: 'id = ?', whereArgs: [id]);
  }
}
