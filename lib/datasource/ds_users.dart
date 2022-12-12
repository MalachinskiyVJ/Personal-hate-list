import 'package:personal_hate_list/database/users_table.dart' as users;
import 'package:personal_hate_list/model/user.dart';
import 'package:sqflite/sqflite.dart';

class UsersDatasource {
  final Database db;

  UsersDatasource(this.db);

  Future<void> saveUser(User user) async {
    Map<String, dynamic> row = {
      users.columnName: user.name,
      users.columnAge: user.age,
    };
    db.insert(users.tableName, row);
    //db.rawInsert('INSERT INTO my_table(name, age) VALUES("Alex", 22)');
  }

  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(
        milliseconds: 1500)); //just for loading simuation and funny loader
    final result = await db.query(users.tableName);
    if (result.isEmpty) {
      return [];
    }
    return result
        .map((it) => User(
              id: it[users.columnId] as int,
              name: it[users.columnName] as String,
              age: it[users.columnAge] as int,
            ))
        .toList();
  }

  Future<void> cleanAllUsers() async {
    await Future.delayed(const Duration(
        milliseconds: 2000)); //just for loading simuation and funny loader
    await db.transaction((transaction) async {
      //await transaction.rawQuery('...');
      await transaction.delete(users.tableName);
      // where: ...
    });
  }
}
