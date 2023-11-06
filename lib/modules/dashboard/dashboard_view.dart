import 'package:flutter/material.dart';
import 'package:oficinar/modules/dashboard/widgets/container_menu_left.dart';
import 'package:oficinar/modules/users/user_model.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContainerMenuLeft(),
            Container(),
          ],
        ),
      ),
    );
  }
}
