import 'package:flutter/material.dart';
import 'package:oficinar/modules/auth/widgets/container_login.dart';
import 'package:oficinar/widgets/night_theme_floating.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            const ContainerLoginView(),
          ],
        ),
      ),
      floatingActionButton: const NightThemeFloating(),
    );
  }
}
