import 'package:flutter/material.dart';
import 'package:oficinar/widgets/card_menu_container.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRightDashboard(
      appBar: AppBar(title: const Text("Gerenciar ordem de serviços")),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CardMenuContainer(
                  title: "Abrir",
                  content: "Realizar cadastro de um serviço",
                  iconData: Icons.build_rounded,
                ),
                CardMenuContainer(
                  title: "Procurar",
                  content:
                      "Pesquise por uma ordem de serviço utilizando seus dados",
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
