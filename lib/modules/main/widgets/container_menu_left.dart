import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_view.dart';
import 'package:oficinar/modules/devices/devices_view.dart';
import 'package:oficinar/modules/logs/logger_view.dart';
import 'package:oficinar/modules/services/services_view.dart';
import 'package:oficinar/widgets/button_action.dart';
import 'package:provider/provider.dart';

Map<int, dynamic> _menu = {
  0: {
    "title": "Ordens de serviço",
    "icon": Icons.build_circle_sharp,
    "page": const ServicesView(),
  },
  1: {
    "title": "Aparelhos",
    "icon": Icons.devices_other_rounded,
    "page": const DevicesView(),
  },
  2: {
    "title": "Clientes",
    "icon": Icons.person,
    "page": const ConsumersView(),
  },
  3: {
    "title": "Logs",
    "icon": Icons.app_registration_outlined,
    "page": const LoggerView(),
  },
};

class ContainerMenuLeft extends StatelessWidget {
  const ContainerMenuLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          border: Border(
            right: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        child: ListView.builder(
          itemCount: _menu.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: ButtonAction(
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    context.read<Navigation>().pageView(_menu[index]['page']);
                  },
                  icon: Icon(_menu[index]['icon']),
                  label: Text(_menu[index]['title'])),
            );
          },
        ));
  }
}
