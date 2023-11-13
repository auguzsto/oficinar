// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oficinar/main.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/widgets/handler_exception.dart';

class ConsumersController with ChangeNotifier {
  Future<void> create(
      ConsumersModel consumersModel, BuildContext context) async {
    try {
      await db.insert("consumers", consumersModel.toJson());
      notifyListeners();
    } catch (e) {
      throw showHandler(context, HandlerException(content: e.toString()));
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
