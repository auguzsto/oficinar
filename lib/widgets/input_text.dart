import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  const InputTextWidget({
    super.key,
    required this.labelText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        labelText: labelText,
      ),
    );
  }
}
