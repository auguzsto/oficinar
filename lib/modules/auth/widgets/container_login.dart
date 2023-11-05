import 'package:flutter/material.dart';
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
          SizedBox(height: 10),
          InputTextWidget(labelText: "Login", iconData: Icons.person),
          SizedBox(height: 10),
          InputTextWidget(labelText: "Senha", iconData: Icons.key),
          SizedBox(height: 10),
          ButtonAction()
        ],
      ),
    );
  }
}
