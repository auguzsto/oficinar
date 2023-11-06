import 'package:flutter/material.dart';
import 'package:oficinar/modules/auth/auth_view.dart';
import 'package:oficinar/modules/themes/themes_controller.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Oficinar",
      home: const AuthView(),
      theme: context.watch<ThemesController>().currentTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
