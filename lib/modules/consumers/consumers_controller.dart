// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/main.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/modules/consumers/consumers_view.dart';
import 'package:oficinar/modules/main/main_view.dart';
import 'package:provider/provider.dart';

class ConsumersController with ChangeNotifier {
  Future<void> create(
      ConsumersModel consumersModel, BuildContext context) async {
    try {
      await db.insert("consumers", consumersModel.toJson());

      context.read<Navigation>().pageView(const ConsumersView());
      logger.create(userLogged.username!,
          "Registrou um novo cliente ${consumersModel.fullName}");

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
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    try {
      return await db.select("*", "consumers").toList();
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
          .limit(10)
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
