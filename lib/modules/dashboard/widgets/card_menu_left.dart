import 'package:flutter/material.dart';

class CardMenuLeft extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  const CardMenuLeft({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon,
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
