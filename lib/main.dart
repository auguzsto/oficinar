import 'package:flutter/material.dart';
import 'package:oficinar/app_widget.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/injector_depency.dart';
import 'package:oficinar/modules/themes/themes_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Injection dependecies.
  setup();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemesController()),
        ChangeNotifierProvider(create: (context) => Navigation())
      ],
      child: const AppWidget(),
    ),
  );
}
