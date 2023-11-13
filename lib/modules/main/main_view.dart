import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/injector_depency.dart';
import 'package:oficinar/modules/main/widgets/avatar_menu_left.dart';
import 'package:oficinar/modules/main/widgets/container_menu_left.dart';
import 'package:oficinar/modules/users/user_model.dart';
import 'package:oficinar/widgets/night_theme_floating.dart';
import 'package:provider/provider.dart';

final userLogged = getDep.get<UserModel>();

class MainView extends StatelessWidget {
  final UserModel userModel;
  const MainView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Column(
              children: [
                AvatarMenuLeft(),
                const Expanded(
                  child: ContainerMenuLeft(),
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: context.watch<Navigation>().currentView,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const NightThemeFloating(),
    );
  }
}
