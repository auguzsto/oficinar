import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

class DatabaseCore {
  int version;
  String? _query;
  DatabaseCore({required this.version}) {
    _init();
  }

  Future<Database> _init() async {
    try {
      var databaseFactory = databaseFactoryFfi;
      final dir = await getApplicationDocumentsDirectory();
      String dbPath = p.join(dir.path,
          "/home/maugusto/Dev/oficinar/lib/database", "oficinar_$version.db");
      if (dbPath.isEmpty) {
        throw Exception("Diretório não encontrado");
      }

      Database db = await databaseFactory.openDatabase(dbPath,
          options: OpenDatabaseOptions(
            version: version,
            onCreate: (db, version) async {
              await db.execute(_migration);
            },
          ));

      if (await db.getVersion() < 0) {
        throw Exception("Banco de dados não iniciado");
      }

      return db;
    } catch (e) {
      rethrow;
    }
  }

  DatabaseCore select(String columns, String table) {
    _query = "SELECT $columns FROM $table";
    return this;
  }

  DatabaseCore where(String conditions) {
    _query = "$_query WHERE $conditions";
    return this;
  }

  DatabaseCore and() {
    _query = "$_query AND";
    return this;
  }

  Future<List<Map<dynamic, dynamic>>> toList() async {
    final db = await DatabaseCore(version: version)._init();
    return db.query(_query!);
  }
}

String _migration = '''
CREATE TABLE IF NOT EXISTS users(
  id INT AUTO_INCREMENT,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  PRIMARY KEY (id)
);
''';
