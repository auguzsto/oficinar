// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/injector_depency.dart';
import 'package:oficinar/main.dart';
import 'package:oficinar/modules/main/main_view.dart';
import 'package:oficinar/modules/logs/logger_controller.dart';
import 'package:oficinar/modules/logs/logger_model.dart';
import 'package:oficinar/modules/users/user_model.dart';
import 'package:oficinar/widgets/handler_exception.dart';

class AuthController {
  static Future<void> signIn(
      String username, String password, BuildContext context) async {
    try {
      late UserModel userModel;

      userModel = UserModel.fromJson({
        "username": username,
        "password": password,
      });

      final data = await db
          .select("*", "users")
          .where("username = '$username'")
          .and("password = '$password'")
          .toList();
      if (data.isEmpty) {
        LoggerController(LoggerModel(userModel.username!,
            "Tentou realizar login", "${DateTime.now().toLocal()}"));

        throw Exception("Usuário ou senha inválidos.");
      }

      getDep.registerSingleton<UserModel>(UserModel.fromJson(data[0]));
      userModel = getDep.get<UserModel>();

      LoggerController(LoggerModel(userModel.username!,
          "Realizou login com sucesso", "${DateTime.now().toLocal()}"));

      Navigation.pushAndRemovePile(MainView(userModel: userModel), context);
    } catch (e) {
      throw showHandler(
          context,
          HandlerException(
            content: e.toString(),
            textLeftButton: "Entendido",
          ));
    }
  }
}
