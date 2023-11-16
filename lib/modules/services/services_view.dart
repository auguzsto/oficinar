import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_controller.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/modules/consumers/widgets/add_consumers.dart';
import 'package:oficinar/modules/services/views/add_services_view.dart';
import 'package:oficinar/widgets/card_menu_container.dart';
import 'package:oficinar/widgets/handler_exception.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';
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
      leftOnPressed: () {
        _getConsumer(context);
      },
      textRightButton: "Não, cadastrar cliente",
      rightOnPressed: () => _registerConsumer(context),
    ),
  );
}

void _getConsumer(BuildContext context) {
  Navigator.pop(context);
  showDialog(
    context: context,
    builder: (context) {
      final isSearch = ValueNotifier<bool>(false);
      final controllerInputText = TextEditingController();
      return Dialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            AppBar(title: const Text("Selecione um cliente para abrir OS")),
            AnimatedBuilder(
              animation: isSearch,
              builder: (context, child) => FutureBuilder(
                future: isSearch.value == false
                    ? ConsumersController.getByLastAdded()
                    : ConsumersController.getByName(controllerInputText.text),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final consumerModel = ConsumersModel.fromJson(
                            snapshot.data?[index] ?? {});
                        return ListTile(
                          onTap: () => _registerService(context, consumerModel),
                          leading: CircleAvatar(
                            child: Text(consumerModel.fullName![0]),
                          ),
                          title: Text(consumerModel.fullName!),
                          subtitle: Text(consumerModel.phone!),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: controllerInputText,
              onSubmitted: (value) {
                value.isEmpty ? isSearch.value = false : isSearch.value = true;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  hintText:
                      "Procure cliente por nome completo, pressione o enter",
                  prefixIcon: const Icon(Icons.person)),
            ),
          ],
        ),
      );
    },
  );
}

void _registerConsumer(BuildContext context) {
  context.read<Navigation>().pageView(AddConsumersWidget());
  Navigator.pop(context);
}

void _registerService(BuildContext context, ConsumersModel consumersModel) {
  context
      .read<Navigation>()
      .pageView(ServicesAddView(consumersModel: consumersModel));
  Navigator.pop(context);
}
