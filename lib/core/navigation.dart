import 'package:flutter/material.dart';

class Navigation with ChangeNotifier {
  late Widget currentView = const Column();
  static void pushAndRemovePile(Widget view, BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => view,
        ),
        (route) => false);
  }

  static void popAndRemovePile(BuildContext context) {
    Navigator.popUntil(context, (route) => false);
  }

  void pageView(Widget view) {
    currentView = view;
    notifyListeners();
  }
}
