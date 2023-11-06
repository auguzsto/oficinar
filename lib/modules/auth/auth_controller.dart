// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oficinar/core/database_core.dart';
import 'package:oficinar/injector_depency.dart';
import 'package:oficinar/modules/users/user_model.dart';
import 'package:oficinar/widgets/handler_exception.dart';

class AuthController {
  static Future<void> signIn(
      String username, String password, BuildContext context) async {
    try {
      final db = getDep.get<DatabaseCore>();
      late UserModel userModel;

      userModel = UserModel.fromJson({
        "username": username,
        "password": password,
      });

      final data = await db
          .select("*", "users")
          .where("username = '$username' AND password = '$password'")
          .toList();
      if (data.isEmpty) {
        throw Exception("Usuário ou senha inválidos.");
      }

      userModel =
          getDep.registerSingleton<UserModel>(UserModel.fromJson(data[0]));
      print(userModel.toJson());
    } catch (e) {
      throw showHandler(
          context,
          HandlerException(
            title: "Atenção",
            content: e.toString(),
            textLeftButton: "Entendido",
          ));
    }
  }
}
