import 'package:flutter/material.dart';
import 'package:oficinar/modules/dashboard/widgets/avatar_menu_left.dart';
import 'package:oficinar/modules/dashboard/widgets/card_menu_left.dart';

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
                color: Theme.of(context).colorScheme.onSecondaryContainer)),
      ),
      child: ListView(
        children: const [
          AvatarMenuLeft(),
          CardMenuLeft(icon: Icons.home_repair_service, title: "Aparelhos"),
          CardMenuLeft(icon: Icons.person, title: "Usuários"),
          CardMenuLeft(icon: Icons.person_pin, title: "Clientes"),
          CardMenuLeft(icon: Icons.security, title: "Políticas"),
          CardMenuLeft(icon: Icons.calendar_month, title: "Agenda"),
        ],
      ),
    );
  }
}
