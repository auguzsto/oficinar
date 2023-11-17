import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
    BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Operação realizada com sucesso")));
}
