import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static final DatabaseHelper instance = DatabaseHelper();

  DatabaseHelper();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'DB_study.db');

    return await openDatabase(
      path,
      version: 4,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE student(
        ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        address TEXT,
        major INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE major(
        name TEXT
      )
    ''');

  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("Database upgrade from $oldVersion to $newVersion");
  }

  // دالة قراءة البيانات من الجدول
  Future<List<Map>> readData(String sql) async {
    final db = await database;
    return await db.rawQuery(sql);
  }

  // دالة لإدراج بيانات في الجدول
  Future<int> addData(String sql) async {
    final db = await database;
    return await db.rawInsert(sql);
  }
}
