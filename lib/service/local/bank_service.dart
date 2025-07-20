import 'package:inst_pay/model/bank.dart';
import 'package:inst_pay/service/local/db_service.dart';
import 'package:sqflite/sqflite.dart';

class BankService {
  static Future<void> createBankTable(Database database) async {
    await database.execute('''
  CREATE TABLE bank (
    id INTEGER PRIMARY KEY ,
    image TEXT,
    url TEXT,
    name TEXT
  )
''');
  }

  static Future<int> createBank(
    int id,
    String url,
    String image,
    String name,
  ) async {
    final db = await DbService.db();
    final data = {'id': id, 'url': url, 'image': image, 'name': name};
    await db.insert('bank', data, conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<BankModel>> getBank() async {
    final db = await DbService.db();
    final res = await db.query('bank', orderBy: "id");
    if (res.isEmpty) {
      return [];
    }
    return res.map((e) => BankModel.fromJson(e)).toList();
  }

  static Future<BankModel?> getBankById(int id) async {
    final db = await DbService.db();
    final res = await db.query(
      'bank',
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );
    print(res.toString());
    if (res.isNotEmpty) {
      return BankModel.fromJson(res[0]);
      // where fl cas hethy traj3 liste but i limite by 0
    }

    return null;
  }
}
