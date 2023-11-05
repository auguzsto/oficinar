import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class UserMigration {
  static createTable(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS users');
    batch.execute(_schema);
  }

  static updateTable(Batch batch) {
    batch.execute('ALTER TABLE users ADD full_name TEXT NOT NULL');
  }
}

String _schema = '''
CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    full_name TEXT NOT NULL,
    created_at TEXT NOT NULL,
    updated_at TEXT,
    deleted_at TEXT
  ); 
''';
