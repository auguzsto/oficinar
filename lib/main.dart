import 'package:flutter/material.dart';
import 'package:oficinar/app_widget.dart';
import 'package:oficinar/core/database_core.dart';
import 'package:oficinar/injector_depency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Inject dependecy.
  setup();

  //Init database SQLite.
  getDep.getAsync<DatabaseCore>();

  runApp(const AppWidget());
}

final db = getDep.getAsync<DatabaseCore>();
