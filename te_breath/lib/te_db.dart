import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:te_breath/te_models/te_anamnesis_model.dart';
import 'package:te_breath/te_models/te_note_model.dart';
import 'package:te_breath/te_models/te_notedate_model.dart';
import 'package:te_breath/te_models/te_reminder_model.dart';

class TeDBHelper {
  static final _dbHelper = TeDBHelper._createInstance();

  Database? _db = null;

  TeDBHelper._createInstance();

  factory TeDBHelper() {
    return _dbHelper;
  }

  Future<Database> get database async {
    _db ??= await initDb();

    return _db!;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'te.db');

    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  // Если бд нет в директории прилы, то создаем ее
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Anamnesis (id INTEGER PRIMARY KEY AUTOINCREMENT, arise TEXT, symptoms TEXT, count TEXT, duration TEXT, family TEXT)');
    await db.execute(
        'CREATE TABLE Notes (id INTEGER PRIMARY KEY AUTOINCREMENT, day TEXT, month TEXT, year TEXT, beingType TEXT, reasons TEXT, food TEXT, location TEXT, allergen TEXT, plants TEXT, animals TEXT)');
    await db.execute(
        'CREATE TABLE Reminders (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, dosage TEXT, timerType TEXT, specifyTime TEXT, notes TEXT, iconType TEXT)');
  }

  Future<int> addTeAnamnesis(TeAnamnesisModel teAnamnesisModel) async {
    Database db = await database;
    int result = await db.insert('Anamnesis', teAnamnesisModel.toMap());

    return result;
  }

  Future<int> addTeNote(TeNoteModel teNoteModel) async {
    Database db = await database;
    int result = await db.insert('Notes', teNoteModel.toMap());

    return result;
  }

  Future<int> addTeReminder(TeReminderModel teReminderModel) async {
    Database db = await database;
    int result = await db.insert('Reminders', teReminderModel.toMap());

    return result;
  }

  Future<int> deteleTeAnamnesis(TeAnamnesisModel teAnamnesisModel) async {
    Database db = await database;
    int result = await db
        .delete('Anamnesis', where: 'id = ?', whereArgs: [teAnamnesisModel.id]);

    return result;
  }

  Future<int> deteleTeNote(TeNoteModel teNoteModel) async {
    Database db = await database;
    int result =
        await db.delete('Notes', where: 'id = ?', whereArgs: [teNoteModel.id]);

    return result;
  }

  Future<int> deteleTeReminder(TeReminderModel teReminderModel) async {
    Database db = await database;
    int result = await db
        .delete('Reminders', where: 'id = ?', whereArgs: [teReminderModel.id]);

    return result;
  }

  Future<int> updateTeAnamnesis(TeAnamnesisModel teAnamnesisModel) async {
    Database db = await database;
    int result = await db.update('Anamnesis', teAnamnesisModel.toMap(),
        where: 'id = ?', whereArgs: [teAnamnesisModel.id]);

    return result;
  }

  Future<int> updateTeNote(TeNoteModel teNoteModel) async {
    Database db = await database;
    int result = await db.update('Notes', teNoteModel.toMap(),
        where: 'id = ?', whereArgs: [teNoteModel.id]);

    return result;
  }

  Future<int> updateTeReminder(TeReminderModel teReminderModel) async {
    Database db = await database;
    int result = await db.update('Reminders', teReminderModel.toMap(),
        where: 'id = ?', whereArgs: [teReminderModel.id]);

    return result;
  }

  Future<List<TeAnamnesisModel>> getAllAnamnesis() async {
    Database db = await database;
    List<Map<String, dynamic>> mapList =
        await db.query('Anamnesis', orderBy: 'id DESC');

    return mapList.map((e) => TeAnamnesisModel.fromMap(e)).toList();
  }

  Future<List<TeReminderModel>> getAllReminders() async {
    Database db = await database;
    List<Map<String, dynamic>> mapList =
        await db.query('Reminders', orderBy: 'id DESC');

    return mapList.map((e) => TeReminderModel.fromMap(e)).toList();
  }

  Future<List<TeNoteModel>> getAllNotes(String selMonth, String selYear) async {
    Database db = await database;
    List<Map<String, dynamic>> mapList = await db.query('Notes',
        where: 'month = ? and year = ?',
        whereArgs: [selMonth, selYear],
        orderBy: 'id DESC');

    return mapList.map((e) => TeNoteModel.fromMap(e)).toList();
  }

  Future<List<TeNotedateModel>> getAllNotesDate(
      String selMonth, String selYear) async {
    Database db = await database;
    List<Map<String, dynamic>> mapList = await db.query('Notes',
        where: 'month = ? and year = ?',
        columns: ['day', 'beingType'],
        whereArgs: [selMonth, selYear],
        orderBy: 'id DESC');

    return mapList.map((e) => TeNotedateModel.fromMap(e)).toList();
  }
}
