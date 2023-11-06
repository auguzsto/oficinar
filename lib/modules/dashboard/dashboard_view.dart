import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/auth/auth_view.dart';
import 'package:oficinar/modules/users/user_model.dart';

class DashboardView extends StatelessWidget {
  final UserModel userModel;
  const DashboardView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton.filled(
            onPressed: () =>
                Navigation.pushAndRemovePile(const AuthView(), context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text("Olá, ${userModel.username}"),
      ),
    );
  }
}
