import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputTextWidget extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final TextEditingController controller;
  final bool? obscureText;
  final MaskTextInputFormatter? formatter;
  const InputTextWidget({
    super.key,
    required this.labelText,
    required this.iconData,
    required this.controller,
    this.obscureText,
    this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        inputFormatters: [formatter ?? MaskTextInputFormatter()],
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.background,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
