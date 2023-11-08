import 'package:oficinar/core/database_core.dart';
import 'package:oficinar/injector_depency.dart';
import 'package:oficinar/modules/logs/logger_model.dart';

class LoggerController {
  LoggerController(LoggerModel loggerModel) {
    _create(loggerModel);
  }
  Future<void> _create(LoggerModel loggerModel) async {
    try {
      final db = await getDep.getAsync<DatabaseCore>();
      db.insert("logs", loggerModel.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
