import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  // Getter for database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Create table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        phone_no INTEGER,
        door_no TEXT,
        street TEXT,
        city TEXT,
        pincode INTEGER,
        password TEXT
      )
    ''');
  }

  // CRUD Operations
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('users');
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final db = await database;
    final result = await db.query('users', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) return result.first;
    return null;
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update(
      'users',
      user,
      where: 'id = ?',
      whereArgs: [user['id']],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> formatDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');

    // Close current database connection (if open)
    if (_database != null) {
      await _database!.close();
      _database = null;
    }

    // Delete the file
    if (await File(path).exists()) {
      await deleteDatabase(path);
    }

    // Recreate fresh database
    await _initDatabase();
  }

  ///////////\\\\\\\\
  ///////////\\\\\\\\\
  Future<Map<String, dynamic>?> getLatestUser() async {
    final db = await database;
    final res = await db.query('users', orderBy: 'id DESC', limit: 1);
    if (res.isNotEmpty) return res.first;
    return null;
  }

  Future<Map<String, dynamic>?> getUserByName(String name) async {
    final db = await database;
    final res = await db.query('users', where: 'name = ?', whereArgs: [name]);
    if (res.isNotEmpty) {
      return res.first;
    }
    return null;
  }

  Future<int> deleteUserByName(String name) async {
    final db = await database;
    return await db.delete('users', where: 'name = ?', whereArgs: [name]);
  }

  Future<int> updateUserByName(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update(
      'users',
      user,
      where: 'name = ?',
      whereArgs: [user['name']],
    );
  }
}
