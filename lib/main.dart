import 'package:flutter/material.dart';
import 'package:oficinar/app_widget.dart';
import 'package:oficinar/injector_depency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Injection dependecies.
  setup();

  runApp(const AppWidget());
}
