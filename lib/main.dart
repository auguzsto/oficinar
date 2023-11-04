import 'package:flutter/material.dart';
import 'package:oficinar/app_widget.dart';
import 'package:oficinar/injector_depency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const AppWidget());
}
