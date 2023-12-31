import 'package:oficinar/database/migrations.dart';
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
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      final dir = await getApplicationDocumentsDirectory();
      String dbPath = p.join(dir.path, "database", "oficinar.db");
      if (dbPath.isEmpty) {
        throw Exception("Diretório não encontrado");
      }

      int migrations = Migrations.scripts.length;
      Database db = await databaseFactory.openDatabase(dbPath,
          options: OpenDatabaseOptions(
            version: version,
            onConfigure: (db) => _onConfigure(db),
            onCreate: (db, version) async {
              for (var i = 1; i <= migrations; i++) {
                await db.execute(Migrations.scripts[i]!);
              }
            },
            onUpgrade: (db, oldVersion, newVersion) async {
              for (int i = oldVersion + 1; i <= newVersion; i++) {
                await db.execute(Migrations.scripts[i]!);
              }
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

  DatabaseCore and(String conditions) {
    _query = "$_query AND $conditions";
    return this;
  }

  DatabaseCore orderByAsc(String columns) {
    _query = "$_query ORDER BY $columns ASC";
    return this;
  }

  DatabaseCore orderByDesc(String columns) {
    _query = "$_query ORDER BY $columns DESC";
    return this;
  }

  DatabaseCore limit(int limit) {
    _query = "$_query LIMIT $limit";
    return this;
  }

  Future<List<Map<String, dynamic>>> toList() async {
    try {
      final db = await _init();
      return db.rawQuery(_query!);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> single() async {
    try {
      final db = await _init();
      final single = await db.rawQuery(_query!);
      if (single.isEmpty) {
        throw Exception("Por favor, tente novamente.");
      }
      return Map.castFrom(single[0]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> insert(
      String table, Map<String, dynamic> columnsAndValues) async {
    try {
      final db = await _init();
      await db.insert(table, columnsAndValues);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(
      String table, Map<String, dynamic> columnsAndValues) async {
    try {
      final db = await _init();
      await db.update(table, columnsAndValues,
          where: "id = ?", whereArgs: [columnsAndValues['id']]);
      await db.update(
          table,
          {
            "updated_at": "${DateTime.now().toLocal()}",
          },
          where: "id = ?",
          whereArgs: [columnsAndValues['id']]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(
      String table, Map<String, dynamic> columnsAndValues) async {
    try {
      final db = await _init();
      await db.update(
          table,
          {
            "id": columnsAndValues['id'],
            "deleted_at": "${DateTime.now().toLocal()}",
          },
          where: "id = ?",
          whereArgs: [columnsAndValues['id']]);
    } catch (e) {
      rethrow;
    }
  }
}

Future<void> _onConfigure(Database db) async {
  await db.execute('PRAGMA foreign_keys = ON');
}
