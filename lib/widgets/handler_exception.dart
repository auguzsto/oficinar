import 'package:flutter/material.dart';

class HandlerException extends StatelessWidget {
  const HandlerException({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alerta"),
    );
  }
}

Future<void> showHandler(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return HandlerException();
    },
  );
}
