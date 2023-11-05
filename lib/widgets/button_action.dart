import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final Widget label;
  const ButtonAction({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
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
