import 'package:flutter/material.dart';
import 'package:oficinar/widgets/button_action.dart';

class HandlerException extends StatelessWidget {
  final String? content;
  final void Function()? leftOnPressed;
  final String? textLeftButton;
  final void Function()? rightOnPressed;
  final String? textRightButton;
  final IconData? iconData;
  const HandlerException({
    super.key,
    this.content,
    this.leftOnPressed,
    this.textLeftButton,
    this.rightOnPressed,
    this.textRightButton,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        maxRadius: MediaQuery.of(context).size.height / 10,
        child: Icon(iconData ?? Icons.warning,
            size: MediaQuery.of(context).size.height / 10),
      ),
      content: Text(
        _handlerContentString(content!),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        ButtonAction(
          height: 35,
          onPressed: leftOnPressed ?? () => Navigator.pop(context),
          icon: const Icon(Icons.check_circle),
          label: Text(textLeftButton ?? "Entendido"),
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
