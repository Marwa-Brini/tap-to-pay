import 'package:inst_pay/model/contact_model.dart';
import 'package:inst_pay/service/db_service.dart';
import 'package:sqflite/sqflite.dart';

class ContactService {
  static Future<void> createContactTable(Database database) async {
    await database.execute('''
  CREATE TABLE contact (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    rib TEXT,
    bankID INTEGER,
    FOREIGN KEY (bankID) REFERENCES bank(id) ON DELETE CASCADE
  )
''');
  }

  static Future<int> createContactAccount({
    required String rib,
    required int bankID,
    required String name,
  }) async {
    final db = await DbService.db();
    final data = {'rib': rib, 'bankID': bankID, 'name': name};
    final id = await db.insert(
      'contact',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<ContactModel>> getContacts() async {
    final db = await DbService.db();
    final res = await db.rawQuery('''
  SELECT contact.*, bank.image
  FROM contact
  INNER JOIN bank ON contact.bankID = bank.id
''');

    //  final res = await db.query('contact',orderBy: "id");
    if (res.isEmpty) {
      return [];
    }
    return res.map((e) => ContactModel.fromJson(e)).toList();
  }

  static Future<void> deleteContact(int id) async {
    final db = await DbService.db();
    await db.delete('contact', where: 'id = ?', whereArgs: [id]);
  }
}
