import 'package:flutter/material.dart';
import 'package:oficinar/modules/auth/auth_controller.dart';
import 'package:oficinar/widgets/button_action.dart';
import 'package:oficinar/widgets/input_text.dart';

class ContainerLoginView extends StatelessWidget {
  const ContainerLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          border: BorderDirectional(
              start: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            maxRadius: MediaQuery.of(context).size.height / 10,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: Icon(
              Icons.person,
              size: MediaQuery.of(context).size.height / 10,
            ),
          ),
          const SizedBox(height: 20),
          InputTextWidget(
            controller: _controllerLogin,
            labelText: "Login",
            iconData: Icons.person,
          ),
          const SizedBox(height: 10),
          InputTextWidget(
            obscureText: true,
            controller: _controllerPassword,
            labelText: "Senha",
            iconData: Icons.key,
          ),
          const SizedBox(height: 10),
          ButtonAction(
            icon: const Icon(Icons.check),
            label: const Text("Entrar"),
            onPressed: () async {
              await AuthController.signIn(
                  _controllerLogin.text, _controllerPassword.text, context);
            },
          )
        ],
      ),
    );
  }
}

final _controllerLogin = TextEditingController();
final _controllerPassword = TextEditingController();
