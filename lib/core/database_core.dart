import 'package:oficinar/database/schemas/user_migration.dart';
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
      String dbPath = p.join(dir.path, "database", "oficinar.db");
      if (dbPath.isEmpty) {
        throw Exception("Diretório não encontrado");
      }

      Database db = await databaseFactory.openDatabase(dbPath,
          options: OpenDatabaseOptions(
            version: version,
            onConfigure: (db) => _onConfigure(db),
            onCreate: (db, version) async {
              var batch = db.batch();
              UserMigration.createTable(batch);
              await batch.commit();
            },
            onUpgrade: (db, oldVersion, newVersion) async {
              var batch = db.batch();
              if (oldVersion == 1) {
                UserMigration.updateTable(batch);
                batch.commit();
              }

              await batch.commit();
            },
            onDowngrade: onDatabaseDowngradeDelete,
          ));

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
    return db.rawQuery(_query!);
  }
}

Future<void> _onConfigure(Database db) async {
  await db.execute('PRAGMA foreign_keys = ON');
}
