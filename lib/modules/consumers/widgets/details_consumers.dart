// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_controller.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/modules/consumers/consumers_view.dart';
import 'package:oficinar/widgets/alert_sucess.dart';
import 'package:oficinar/widgets/button_action.dart';
import 'package:oficinar/widgets/handler_exception.dart';
import 'package:oficinar/widgets/input_text.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';
import 'package:provider/provider.dart';

class DetailsConsumersView extends StatelessWidget {
  final ConsumersModel consumersModel;
  const DetailsConsumersView({
    super.key,
    required this.consumersModel,
  });

  @override
  Widget build(BuildContext context) {
    final controllerFullName =
        TextEditingController(text: consumersModel.fullName);
    final controllerEmail = TextEditingController(text: consumersModel.email);
    final controllerCep = TextEditingController(text: consumersModel.cep);
    final controllerAddress =
        TextEditingController(text: consumersModel.address);
    final controllerPhone = TextEditingController(text: consumersModel.phone);
    final controllerPhone2 = TextEditingController(text: consumersModel.phone2);
    final controllerPhone3 = TextEditingController(text: consumersModel.phone3);

    return ScaffoldRightDashboard(
      appBar: AppBar(
        title: Text("Detalhes de ${consumersModel.fullName}"),
        leading: IconButton(
            onPressed: () => _back(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        maxRadius: MediaQuery.of(context).size.height / 15,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        child: Text(consumersModel.fullName![0]),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: ListView(
                        padding: const EdgeInsets.all(12),
                        children: [
                          InputTextWidget(
                              controller: controllerFullName,
                              labelText: "Nome completo",
                              iconData: Icons.person),
                          InputTextWidget(
                              controller: controllerEmail,
                              labelText: "E-mail",
                              iconData: Icons.alternate_email),
                          InputTextWidget(
                              controller: controllerPhone,
                              labelText: "Número para contato",
                              iconData: Icons.phone_iphone),
                          InputTextWidget(
                              controller: controllerCep,
                              labelText: "CEP",
                              iconData: Icons.my_location_rounded),
                          InputTextWidget(
                              controller: controllerAddress,
                              labelText: "Endereço completo",
                              iconData: Icons.location_on),
                          InputTextWidget(
                              controller: controllerPhone2,
                              labelText: "Número para contato 2",
                              iconData: Icons.phone_iphone),
                          InputTextWidget(
                              controller: controllerPhone3,
                              labelText: "Número para contato 3",
                              iconData: Icons.phone_iphone),
                        ],
                      ),
                    ),
                    ButtonAction(
                        shadowColor: Colors.transparent,
                        onPressed: () => _dialog(
                            context,
                            ConsumersModel.fromJson({
                              "id": consumersModel.id,
                              "full_name": controllerFullName.text,
                              "email": controllerEmail.text,
                              "cep": controllerCep.text,
                              "address": controllerAddress.text,
                              "phone": controllerPhone.text,
                              "phone2": controllerPhone2.text,
                              "phone3": controllerPhone3.text,
                              "created_at": consumersModel.createdAt,
                            })),
                        icon: const Icon(Icons.update),
                        label: const Text("Atualizar dados")),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('data2'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _back(BuildContext context) {
  context.read<Navigation>().pageView(const ConsumersView());
}

void _dialog(BuildContext context, ConsumersModel consumersModel) {
  showHandler(
    context,
    HandlerException(
      content: "Deseja atualizar os dados deste cliente?",
      textLeftButton: "Sim",
      leftOnPressed: () async => await _update(consumersModel, context),
    ),
  );
}

Future<void> _update(
    ConsumersModel consumersModel, BuildContext context) async {
  try {
    await context.read<ConsumersController>().update(consumersModel, context);
    Navigator.pop(context);
    showSuccess(context);
  } catch (e) {
    throw showHandler(context, HandlerException(content: e.toString()));
  }
}
