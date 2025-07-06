import 'package:inst_pay/service/bank_account_service.dart';
import 'package:inst_pay/service/bank_service.dart';
import 'package:inst_pay/service/user_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DbService {
  //void _oncreate (Database,int version) async{
  // await database.execute('CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT)');

  static Future<Database> db() async {
    final databasePath = await getApplicationDocumentsDirectory();

    print(databasePath);

    String path = join(databasePath.path, 'sibtel.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await BankAccountService.createBankAccountTable(db);
        await BankService.createBankTable(db);
        await UserService.createUserTable(db);
      },
    );
  }
}
