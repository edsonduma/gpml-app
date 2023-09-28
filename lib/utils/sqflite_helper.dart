import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SqfliteHelper {
  // static late final _database;
  static late final _database;

  static Future<void> init() async {
    onCreate(Database db, version) async {
      // Run the CREATE TABLE IF NOT EXISTS statement on the database.
      // return db.execute(
      //   'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL)',
      //   "INSERT INTO users (id, nome, email, password) VALUES (DEFAULT, 'admin', 'admin@stivy.com', 'admin')",
      //   // 'CREATE TABLE IF NOT EXISTS agencies (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)',
      //   // 'CREATE TABLE IF NOT EXISTS models (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)',
      //   // 'CREATE TABLE IF NOT EXISTS photographers (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)',
      //   // 'CREATE TABLE IF NOT EXISTS designs (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)',
      //   // 'CREATE TABLE IF NOT EXISTS stylists (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)',
      //   // 'CREATE TABLE IF NOT EXISTS makeup_artists (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)',
      // );

      // return db.execute(
      //   'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL); ' +
      //       "INSERT INTO users (id, nome, email, password) VALUES (DEFAULT, 'admin', 'admin', 'admin');",
      // );
      // return db.execute(
      //   'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL)',
      //   "INSERT INTO users (id, nome, email, password) VALUES (DEFAULT, 'admin', 'admin', 'admin')",
      // );

      // return db.execute(
      //   'CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL)',
      // );

      Batch batch = db.batch();
      // batch.execute("Your query-> Create table if not exists");
      batch.execute(
          '''CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL)''');

      batch.execute(
          '''CREATE TABLE IF NOT EXISTS agencies (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, foto TEXT NOT NULL, contactos TEXT NOT NULL)''');
      batch.execute(
          '''CREATE TABLE IF NOT EXISTS models (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, apelido TEXT NOT NULL, altura REAL NOT NULL, cintura REAL NOT NULL, anca REAL NOT NULL, sapato REAL NOT NULL, contactos TEXT NOT NULL, agenciado INTEGER NOT NULL)''');
      // batch.execute(
      //     '''CREATE TABLE IF NOT EXISTS photographers (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)''');
      // batch.execute(
      //     '''CREATE TABLE IF NOT EXISTS designs (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)''');
      // batch.execute(
      //     '''CREATE TABLE IF NOT EXISTS stylists (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)''');
      // batch.execute(
      //     '''CREATE TABLE IF NOT EXISTS makeup_artists (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)''');

      // "INSERT INTO users (id, nome, email, password) VALUES (DEFAULT, 'admin', 'admin@stivy.com', 'admin')",

      // List<dynamic> res =
      await batch.commit();
    }

    if (kIsWeb) {
      // var path = 'storage/';
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
      // path = 'stivy_web.db';

      _database = openDatabase(
        // path,
        // 'storage/stivy_web.db',
        // 'assets/stivy_web.db',
        'stivy_web.db',
        onCreate: onCreate,
        version: 1,
      );
    } else {
      _database = openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        join(await getDatabasesPath(), 'stivy_database.db'),
        // When the database is first created, create a table to store users.
        onCreate: onCreate,
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1,
      );
    }
    executeSeeds();

    // Database myDb = await openDatabase('');
    // myDb.insert(table, values);
    // int idReturned = await _database.rawInsert(
    //     "INSERT INTO users (id, nome, email, password) VALUES (DEFAULT, 'admin', 'admin', 'admin')");
    // print("idReturned $idReturned");

    // int idReturned = await db.rawInsert(
    //     "INSERT INTO users (id, nome, email, password) VALUES (DEFAULT, 'admin', 'admin', 'admin')");
    // print("idReturned $idReturned");
  }

  static Future<void> executeSeeds() async {
    Database db = await _database;

    await db.insert(
      'users',
      {'nome': 'admin', 'email': 'admin', 'password': 'admin'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // await db.(
    //     'CREATE TABLE IF NOT EXISTS agencies (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL)');

    // await db.insert(
    //   'agencies',
    //   {'nome': 'TESTE'},
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
    // await db.insert(
    //   'users',
    //   {'nome': 'admin', 'email': 'admin', 'password': 'admin'},
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
  }

  // Define a function that inserts users into the database
  static Future<void> insert(String table, Map<String, dynamic> row) async {
    // Get a reference to the database.
    // final db = database;
    final db = await _database;

    // Insert the User into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same user is inserted twice.
    //
    // In this case, replace any previous data.

    // db.execute('''DROP TABLE IF EXISTS agencies''');
    // db.execute(
    //     '''CREATE TABLE IF NOT EXISTS agencies (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, foto TEXT, contactos TEXT)''');

    await db.insert(
      table,
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the users from the users table.
  // Future<List<dynamic>> getList(String table) async {
  // static Future<List<Map<String, dynamic>>> getList(String table) async {
  static Future<List<Map<String, dynamic>>> getAllList(String table) async {
    // Get a reference to the database.
    final db = await _database;

    // Query the table for all The Dogs.
    // final List<Map<String, dynamic>> maps = await _database.query(table);
    return db.query(table);
  }

  // A method that retrieves an instance of Data from the Model table.
  // Future<dynamic> getSingleData(String table, id) async {
  //   return await _database.query(table, where: 'id = ?', whereArgs: [id]);
  // }

  static Future<dynamic> getDataByField(
    String table,
    String value, {
    String field = 'id',
  }) async {
    final db = await _database;

    // final maps = await db.query(table, where: '$field = ?', whereArgs: [value]);
    List<Map> maps =
        await db.query(table, where: '$field = ?', whereArgs: [value]);

    return maps[0];
  }

  static Future<String?> login(String email, String password) async {
    final db = await _database;
    // final maps = await db.query('users',
    //     where: 'email = ? AND password = ?', whereArgs: [email, password]);
    List<Map> maps = await db.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    // print('maps.length: ${maps.length}, ${maps.isNotEmpty}');

    // return maps.isNotEmpty;
    // return maps.length != 0;

    if (maps.length != 0) return maps[0]['nome'];
    return null;
  }
}
