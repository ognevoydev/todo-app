import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import '../model/todo.dart';

class DBProvider {
  DBProvider._();

  static const dbName = "Database";
  static const tableName = "ToDo";

  static final DBProvider db = DBProvider._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}$dbName.db";
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "id INTEGER PRIMARY KEY,"
          "text TEXT,"
          "isDone BIT"
          ")");
    });
  }

  addToDo(ToDo todo) async {
    final db = await database;
    return await db?.insert(tableName, todo.toMap());
  }

  getToDoById(int? id) async {
    final db = await database;
    var res = await db?.query(tableName, where: "id = ?", whereArgs: [id]);
    if (res!.isNotEmpty) {
      return ToDo.fromMap(res.first);
    }
    return null;
  }

  Future<List<ToDo>> getAllToDos() async {
    final db = await database;
    var res = await db?.query(tableName);
    List<ToDo> list =
        res!.isNotEmpty ? res.map((item) => ToDo.fromMap(item)).toList() : [];
    return list;
  }

  toggleIsDone(ToDo todo) async {
    final db = await database;
    ToDo todoToggled =
        ToDo.withId(id: todo.id, text: todo.text, isDone: !todo.isDone);
    return await db?.update(tableName, todoToggled.toMap(),
        where: "id = ?", whereArgs: [todo.id]);
  }

  deleteToDoById(int id) async {
    final db = await database;
    return db?.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
