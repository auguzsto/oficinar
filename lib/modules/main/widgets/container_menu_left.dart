import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_view.dart';
import 'package:oficinar/modules/main/widgets/avatar_menu_left.dart';
import 'package:oficinar/modules/logs/logger_view.dart';
import 'package:oficinar/widgets/button_action.dart';
import 'package:provider/provider.dart';

class ContainerMenuLeft extends StatelessWidget {
  const ContainerMenuLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: ListView(
        children: [
          AvatarMenuLeft(),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: ButtonAction(
                alignment: Alignment.centerLeft,
                onPressed: () {
                  context.read<Navigation>().pageView(const Column());
                },
                icon: const Icon(Icons.build_circle_sharp),
                label: const Text('Ordens de serviço')),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: ButtonAction(
                alignment: Alignment.centerLeft,
                onPressed: () {},
                icon: const Icon(Icons.devices_other_rounded),
                label: const Text('Aparelhos')),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: ButtonAction(
                alignment: Alignment.centerLeft,
                onPressed: () {
                  context.read<Navigation>().pageView(const ConsumersView());
                },
                icon: const Icon(Icons.person),
                label: const Text('Clientes')),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: ButtonAction(
                alignment: Alignment.centerLeft,
                onPressed: () {
                  context.read<Navigation>().pageView(const LoggerView());
                },
                icon: const Icon(Icons.app_registration_outlined),
                label: const Text('Logs')),
          ),
        ],
      ),
    );
  }
}
