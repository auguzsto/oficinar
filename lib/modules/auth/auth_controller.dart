import 'package:flutter/material.dart';
import 'package:oficinar/modules/auth/auth_model.dart';
import 'package:oficinar/widgets/handler_exception.dart';

class AuthController {
  static Future<void> signIn(
      String username, String password, BuildContext context) async {
    try {
      final authModel = AuthModel(username, password);
      print("Login");
    } catch (e) {
      throw showHandler(context);
    }
  }
}
