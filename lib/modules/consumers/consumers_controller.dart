// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oficinar/main.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/modules/main/main_view.dart';
import 'package:oficinar/widgets/handler_exception.dart';

class ConsumersController with ChangeNotifier {
  Future<void> create(
      ConsumersModel consumersModel, BuildContext context) async {
    try {
      await db.insert("consumers", consumersModel.toJson());

      logger.create(userLogged.username!,
          "Registrou um novo cliente ${consumersModel.fullName}");
      notifyListeners();
    } catch (e) {
      if (e.toString().contains("consumers.phone")) {
        throw Exception("Já existe um cliente com este número para contato.");
      }
      rethrow;
    }
  }

  Future<void> update(
      ConsumersModel consumersModel, BuildContext context) async {
    try {
      await db.update("consumers", consumersModel.toJson());
      await db.update(
        "consumers",
        {"updated_at": "${DateTime.now().toLocal()}"},
      );

      logger.create(userLogged.username!,
          "Atualizou os dados do cliente ${consumersModel.fullName}");
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(
      ConsumersModel consumersModel, BuildContext context) async {
    try {
      await db.delete("consumers", consumersModel.toJson());
      notifyListeners();
    } catch (e) {
      throw showHandler(context, HandlerException(content: e.toString()));
    }
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    try {
      return await db.select("*", "consumers").toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> getByPhone(String value) async {
    try {
      return await db
          .select("*", "consumers")
          .where("phone LIKE '%$value%'")
          .and("deleted_at IS NULL")
          .orderByDesc("created_at")
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> getByName(String value) async {
    try {
      return await db
          .select("*", "consumers")
          .where("full_name LIKE '%$value%'")
          .and("deleted_at IS NULL")
          .orderByDesc("created_at")
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> getByLastAdded() async {
    try {
      return await db
          .select("*", "consumers")
          .where("deleted_at IS NULL")
          .orderByDesc("created_at")
          .limit(15)
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
