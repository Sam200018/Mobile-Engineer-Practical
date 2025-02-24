import 'package:dogs_we_love/model/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await _openDatabase();
    return _db!;
  }

  Future<Database> _openDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "dogs.db");
    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE dogs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        dogName TEXT,
        description TEXT,
        age INTEGER,
        image TEXT )''');
      },
    );
  }

  Future<List<Map>?> selectAllDogs() async {
    final db = await database;
    List<Map>? list = await db.rawQuery('SELECT * FROM dogs');
    return list;
  }

  Future insertAllDogs(List<Dog> dogsList) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var dog in dogsList) {
        int id = await txn.rawInsert(
          'INSERT INTO dogs(dogName, description, age, image) VALUES(?, ?, ?, ?)',
          [dog.dogName, dog.description, dog.age, dog.image],
        );
        print('inserted: $id');
      }
    });
  }
}
