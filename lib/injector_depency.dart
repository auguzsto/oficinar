import 'package:get_it/get_it.dart';
import 'package:oficinar/core/database_core.dart';
import 'package:oficinar/modules/users/user_model.dart';

final getDep = GetIt.instance;

void setup() {
  getDep.registerSingletonAsync<DatabaseCore>(
      () async => DatabaseCore(version: 2));
  getDep.registerSingleton<UserModel>(UserModel());
}
