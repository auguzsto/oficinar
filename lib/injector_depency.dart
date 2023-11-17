import 'package:get_it/get_it.dart';
import 'package:oficinar/core/database_core.dart';
import 'package:oficinar/modules/logs/logger_controller.dart';

final getDep = GetIt.instance;

void setup() {
  getDep.allowReassignment = true;
  getDep.registerSingletonAsync<DatabaseCore>(
      () async => DatabaseCore(version: 8));
  getDep.registerFactory<LoggerController>(() => LoggerController());
}
