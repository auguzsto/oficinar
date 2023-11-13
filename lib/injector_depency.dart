import 'package:get_it/get_it.dart';
import 'package:oficinar/core/database_core.dart';

final getDep = GetIt.instance;

void setup() {
  getDep.allowReassignment = true;
  getDep.registerSingletonAsync<DatabaseCore>(
      () async => DatabaseCore(version: 5));
}
