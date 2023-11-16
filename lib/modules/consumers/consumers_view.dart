import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_controller.dart';
import 'package:oficinar/modules/consumers/widgets/add_consumers.dart';
import 'package:oficinar/modules/consumers/widgets/list_consumers.dart';
import 'package:oficinar/widgets/card_menu_container.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';
import 'package:oficinar/widgets/search_entity.dart';
import 'package:provider/provider.dart';

class ConsumersView extends StatelessWidget {
  const ConsumersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRightDashboard(
      appBar: AppBar(title: const Text("Gerenciar clientes")),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardMenuContainer(
                  title: "Adicionar",
                  content: "Realizar cadastro de um cliente",
                  iconData: Icons.person_add,
                  onPressed: () =>
                      context.read<Navigation>().pageView(AddConsumersWidget()),
                ),
                CardMenuContainer(
                  title: "Procurar",
                  content: "Pesquise por um cliente utilizando seus dados",
                  iconData: Icons.person_search,
                  onPressed: () => _searchConsumers(context),
                ),
                const CardMenuContainer(
                  title: "Relatórios",
                  content: "Gere relatórios",
                  iconData: Icons.file_copy,
                ),
              ],
            ),
          ),
          const ListConsumersWidget(),
        ],
      ),
    );
  }
}

void _searchConsumers(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        child: SearchEntityWidget(
          attrListTitle: "full_name",
          atttrListSubtitle: "phone",
          titleBar: "Clientes",
          hintText: "Procure pelo nome do cliente",
          iconData: Icons.person,
          searchDefault: () {
            return ConsumersController.getByLastAdded();
          },
          searchInputSearch: (inputValue) {
            return ConsumersController.getByName(inputValue);
          },
        ),
      );
    },
  );
}
