import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final Widget label;
  final double? height;
  final Alignment? alignment;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  const ButtonAction({
    super.key,
    this.alignment,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.height,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shadowColor: shadowColor,
          elevation: elevation,
          backgroundColor: backgroundColor,
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
