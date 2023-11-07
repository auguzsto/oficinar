import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final Widget label;
  final double? height;
  final Alignment? alignment;
  const ButtonAction({
    super.key,
    this.alignment,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          alignment: alignment ?? Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: onPressed,
        icon: icon,
        label: label,
      ),
    );
  }
}
