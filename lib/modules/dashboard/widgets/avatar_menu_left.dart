import 'package:flutter/material.dart';

class AvatarMenuLeft extends StatelessWidget {
  const AvatarMenuLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        maxRadius: MediaQuery.of(context).size.height / 10,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.onTertiary,
        child: Icon(
          Icons.person,
          size: MediaQuery.of(context).size.height / 10,
        ),
      ),
    );
  }
}
