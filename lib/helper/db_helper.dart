import 'package:pas_mobile_11pplg1_01/models/product_model_again.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            price FLOAT,
            description TEXT,
            category TEXT,
            image TEXT,
            rate FLOAT,
            count INTEGER,
            isBookmarked BOOL,
          )
        ''');
      },
    );
  }

  Future<int> insertProd(ProductModelAgain list) async {
    final client = await db;
    return client.insert('products', list.toMap());
  }

  Future<List<ProductModelAgain>> getProd() async {
    final client = await db;
    final res = await client.query('products', orderBy: 'id DESC');
    return res.map((e) => ProductModelAgain.fromMap(e)).toList();
  }

  Future<int> updateTodo(int id, ProductModelAgain list) async {
    final client = await db;
    return client.update(
      'products',
      list.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final client = await db;
    return client.delete('products', where: 'id = ?', whereArgs: [id]);
  }
}
