import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  Future<Database> createDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'formdata.db');
    print(path);
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE userdata (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT,contact TEXT,gender TEXT,birthdate TEXT ,language TEXT)');
        });
    return database;
  }
}
