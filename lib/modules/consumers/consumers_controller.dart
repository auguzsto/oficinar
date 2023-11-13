// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oficinar/main.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';

class ConsumersController with ChangeNotifier {
  Future<void> create(ConsumersModel consumersModel) async {
    try {
      await db.insert("consumers", consumersModel.toJson());
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
