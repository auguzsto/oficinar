import 'package:flutter/material.dart';
import 'package:oficinar/modules/themes/themes_controller.dart';
import 'package:provider/provider.dart';

class NightThemeFloating extends StatelessWidget {
  const NightThemeFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () => context.read<ThemesController>().update(),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      child: Icon(
        Icons.nightlight,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
