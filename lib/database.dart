import 'package:sqflite/sqflite.dart';
import 'dart:async';
//mendukug pemrograman asinkron
import 'dart:io';
//bekerja pada file dan directory
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:example/mkontak.dart';
//pubspec.yml

//kelass Dbhelper

class DB {

  static Database _database;
  final String table = 'notes';

  Future<Database> get db async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dir = await getDatabasesPath();
    String path = join(dir, 'note.db');
    var database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database _db, int version) async {
          await _db.execute(
              'CREATE TABLE $table(id INTEGER PRIMARY KEY AUTOINCREMENT,date INTEGER, barang TEXT , pembeli TEXT , harga TEXT)'
          );
        }
    );
    return database;
  }
  Future<void> add(Note2 note) async {
    var database = await db;
    note.setDate();
    await database.insert(table, note.toMap());
  }

  Future<void> update(Note2 note) async {
    var database = await db;
    note.setDate();
    await database.update(table, note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> delete(Note2 note) async {
    var database = await db;
    await database.delete(table, where: 'id = ?', whereArgs: [note.id]);
  }

  Future<List<Note2>> getNotes() async {
    var database = await db;
    List<Map<String, dynamic>> maps = await database.rawQuery('SELECT * FROM $table ORDER BY date DESC');
    List<Note2> notes = new List<Note2>();
    for(Map<String, dynamic> map in maps) {
      notes.add(Note2.fromMap(map));
    }
    return notes;
  }


}
