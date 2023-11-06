import 'package:flutter/material.dart';
import 'package:oficinar/widgets/button_action.dart';

class HandlerException extends StatelessWidget {
  final String? title;
  final String? content;
  final void Function()? leftOnPressed;
  final String? textLeftButton;
  final void Function()? rightOnPressed;
  final String? textRightButton;
  const HandlerException({
    super.key,
    this.title,
    this.content,
    this.leftOnPressed,
    this.textLeftButton,
    this.rightOnPressed,
    this.textRightButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? ""),
      icon: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        maxRadius: MediaQuery.of(context).size.height / 10,
        child:
            Icon(Icons.warning, size: MediaQuery.of(context).size.height / 10),
      ),
      content: Text(_handlerContentString(content!)),
      actions: [
        ButtonAction(
          height: 35,
          onPressed: leftOnPressed ?? () => Navigator.pop(context),
          icon: const Icon(Icons.check_circle),
          label: Text(textLeftButton ?? "Sim"),
        ),
        ButtonAction(
          height: 35,
          onPressed: rightOnPressed,
          icon:
              Icon(Icons.dangerous, color: Theme.of(context).colorScheme.error),
          label: Text(textRightButton ?? "Não"),
        ),
      ],
    );
  }
}

Future<void> showHandler(
    BuildContext context, HandlerException handlerException) async {
  await showDialog(
    context: context,
    builder: (context) {
      return handlerException;
    },
  );
}

String _handlerContentString(String? content) {
  return content!.replaceAll(RegExp(r'Exception: '), "");
}
