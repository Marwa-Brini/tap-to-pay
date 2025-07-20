import 'package:inst_pay/model/user_model.dart';
import 'package:inst_pay/service/local/db_service.dart';
import 'package:sqflite/sqflite.dart';

class UserService {
  static Future<void> createUserTable(Database database) async {
    await database.execute('''
  CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    pin INTEGER,
    phone TEXT,
    image TEXT
  )
''');
  }

  static Future<int> createUser(
    String? name,
    String? tel,
    String? email,
    int pin,
    String? image,
  ) async {
    final db = await DbService.db();
    final data = {
      'name': name,
      'email': email,
      'pin': pin,
      'phone': tel,
      'image': image,
    };
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

  static Future<int> updateUserImage(String imagePath) async {
    final db = await DbService.db();

    return await db.update('user', {'image': imagePath}, where: 'id =1');
  }
}
