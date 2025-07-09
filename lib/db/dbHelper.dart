//Imports:
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'contactSchema.dart';

//Creating a db helper class
class DatabaseHelper {
  //We can use the singleton pattern for only creating a single instance of the whole class
  static Database? _database;
  //Getter to get the initialized db
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb();
    return _database!;
  }

  //Initialization of the db
  Future<Database> _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'contact.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //On Create method to create the table at initialization
  Future _onCreate(Database db, int version) async {
    await db.execute(
      ''' CREATE TABLE contact (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(50) NOT NULL, imagePath TEXT NOT NULL, phone VARCHAR(50) NOT NULL, email VARCHAR(50) NOT NULL, address VARCHAR(50) NOT NULL) ''',
    );
  }

  //CRUD OPERATIONS

  //1. INSERT THE RECORD
  Future<int> insertContact(Contact contact) async {
    Database db = await database; //Calling the getter function
    return await db.insert('contact', contact.toMap());
  }

  //2. READ ALL THE RECORDS
  Future<List<Contact>> getContacts() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'contact',
      orderBy: 'name',
    );
    return maps.map((map) => Contact.fromMap(map)).toList();
  }

  //3. Get The Records By Name
  Future<List<Contact>> searchContact(String name) async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'contact',
      where: 'name = ?',
      orderBy: 'name',
      whereArgs: [name],
    );
    return maps.map((map) => Contact.fromMap(map)).toList();
  }

  //4. Update The Record
  Future<int> updateContact(Contact contact) async {
    Database db = await database;
    return await db.update(
      'contact',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  //5. Delete The Record
  Future<int> deleteContact(int id) async {
    Database db = await database;
    return await db.delete('contact', where: 'id = ?', whereArgs: [id]);
  }
}
