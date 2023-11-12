import 'package:flutter/material.dart';
import 'package:oficinar/widgets/card_menu_container.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';

class DevicesView extends StatelessWidget {
  const DevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRightDashboard(
      appBar: AppBar(title: const Text("Gerenciar aparelhos")),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CardMenuContainer(
                  title: "Cadastrar",
                  content: "Realizar cadastro de aparelho",
                  iconData: Icons.build_rounded,
                ),
                CardMenuContainer(
                  title: "Procurar",
                  content: "Procure por aparelhos",
                  iconData: Icons.search,
                ),
                CardMenuContainer(
                  title: "Relatórios",
                  content: "Gere relatórios",
                  iconData: Icons.file_copy,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
