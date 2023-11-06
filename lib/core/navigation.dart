import 'package:flutter/material.dart';

class Navigation {
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
}
