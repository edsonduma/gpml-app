import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SqfliteHelper {
  static late final _database;

  static Future<void> init() async {
    onCreate(db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL)',
      );
    }

    if (kIsWeb) {
      // var path = 'storage/';
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
      // path = 'stivy_web.db';

      _database = openDatabase(
        // path,
        'storage/stivy_web.db',
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
    await db.insert(
      table,
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the users from the users table.
  // Future<List<dynamic>> getList(String table) async {
  static Future<List<Map<String, dynamic>>> getList(String table) async {
    // Get a reference to the database.
    final db = await _database;

    // Query the table for all The Dogs.
    // final List<Map<String, dynamic>> maps = await _database.query(table);
    return await db.query(table);
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

  static Future<bool> login(String email, String password) async {
    final db = await _database;
    // final maps = await db.query('users',
    //     where: 'email = ? AND password = ?', whereArgs: [email, password]);
    List<Map> maps = await db.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    // print('maps.length: ${maps.length}, ${maps.isNotEmpty}');

    // return maps.isNotEmpty;
    return maps.length != 0;
  }
}
