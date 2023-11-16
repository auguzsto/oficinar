import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_controller.dart';
import 'package:oficinar/modules/consumers/widgets/add_consumers.dart';
import 'package:oficinar/modules/services/widgets/add_services_view.dart';
import 'package:oficinar/widgets/card_menu_container.dart';
import 'package:oficinar/widgets/handler_exception.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';
import 'package:oficinar/widgets/search_entity.dart';
import 'package:provider/provider.dart';

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
              children: [
                CardMenuContainer(
                  onPressed: () => _handlerOpenService(context),
                  title: "Abrir",
                  content: "Realizar cadastro de um serviço",
                  iconData: Icons.build_rounded,
                ),
                const CardMenuContainer(
                  title: "Procurar",
                  content: "Pesquise por uma ordem de serviço",
                  iconData: Icons.search,
                ),
                const CardMenuContainer(
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

void _handlerOpenService(BuildContext context) {
  showHandler(
    context,
    HandlerException(
      content:
          "A ordem de serviço precisa ser registrada à um cliente. O cliente já é cadastrado no sistema?",
      textLeftButton: "Sim, continuar com abertura de OS",
      leftOnPressed: () => _getConsumer(context),
      textRightButton: "Não, cadastrar cliente",
      rightOnPressed: () => _registerConsumer(context),
    ),
  );
}

void _registerConsumer(BuildContext context) {
  context.read<Navigation>().pageView(AddConsumersWidget());
  Navigator.pop(context);
}

void _getConsumer(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        child: SearchEntityWidget(
          searchDefault: () {
            return ConsumersController.getByLastAdded();
          },
          searchInputSearch: (inputValue) {
            return ConsumersController.getByName(inputValue);
          },
          attrListTitle: "full_name",
          atttrListSubtitle: "phone",
          hintText: "Pesquisar por nome completo, pressione o enter.",
          iconData: Icons.person,
          titleBar: "Selecione um cliente para abrir a OS",
        ),
      );
    },
  );
}

void _registerService(BuildContext context) {
  context.read<Navigation>().pageView(const AddServicesView());
  Navigator.pop(context);
}
