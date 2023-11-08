import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/dashboard/widgets/container_menu_left.dart';
import 'package:oficinar/modules/users/user_model.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  final UserModel userModel;
  const DashboardView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            const ContainerMenuLeft(),
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: context.watch<Navigation>().currentView,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
