// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oficinar/main.dart';
import 'package:oficinar/modules/logs/logger_model.dart';
import 'package:oficinar/widgets/handler_exception.dart';

class LoggerController {
  Future<void> create(String author, String describe) async {
    try {
      final loggerModel = LoggerModel(
          author: author,
          describe: describe,
          createdAt: "${DateTime.now().toLocal()}");

      await db.insert("logs", loggerModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> getAll(BuildContext context) async {
    try {
      final result = await db
          .select("*", "logs")
          .orderByDesc("created_at")
          .limit(50)
          .toList();

      if (result.isEmpty) {
        throw Exception("Não foi possível localizar os registros sobre logs");
      }

      return result;
    } catch (e) {
      throw showHandler(
        context,
        HandlerException(
          content: e.toString(),
        ),
      );
    }
  }
}
