import 'package:inst_pay/model/user_model.dart';
import 'package:inst_pay/service/db_service.dart';
import 'package:sqflite/sqflite.dart';

class UserService {
  static Future<void> createUserTable(Database database) async {
    await database.execute('''
  CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    pin INTEGER,
    phone TEXT
  )
''');
  }

  static Future<int> createUser(
    String? name,
    String? tel,
    String? email,
    int pin,
  ) async {
    final db = await DbService.db();
    final data = {'name': name, 'email': email, 'pin': pin, 'phone': tel};
    if (await getUser() == null) {
      final id = await db.insert(
        'user',
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return id;
    }
    return 0;
  }

  static Future<UserModel?> getUser() async {
    final db = await DbService.db();
    final res = await db.query('user', where: "id=1");
    if (res.isEmpty) {
      return null;
    }
    return UserModel.fromJson(res.first);
  }
}
