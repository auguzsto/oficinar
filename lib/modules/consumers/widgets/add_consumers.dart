// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/core/util.dart';
import 'package:oficinar/modules/consumers/consumers_controller.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/modules/consumers/consumers_view.dart';
import 'package:oficinar/widgets/button_action.dart';
import 'package:oficinar/widgets/handler_exception.dart';
import 'package:oficinar/widgets/input_text.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';
import 'package:provider/provider.dart';

class AddConsumersWidget extends StatelessWidget {
  AddConsumersWidget({super.key});

  final _controllerFullName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerCep = TextEditingController();
  final _controllerAddress = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerPhone2 = TextEditingController();
  final _controllerPhone3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldRightDashboard(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                context.read<Navigation>().pageView(const ConsumersView()),
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Cadastro de cliente"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputTextWidget(
              labelText: "Nome completo",
              iconData: Icons.person,
              controller: _controllerFullName),
          InputTextWidget(
              labelText: "Email",
              iconData: Icons.alternate_email,
              controller: _controllerEmail),
          InputTextWidget(
              labelText: "CEP",
              formatter: Util.maskCep(_controllerCep.text),
              iconData: Icons.local_post_office,
              controller: _controllerCep),
          InputTextWidget(
              labelText: "Endereço completo",
              iconData: Icons.add_location,
              controller: _controllerAddress),
          InputTextWidget(
              labelText: "Número para contato",
              formatter: Util.maskPhone(_controllerPhone.text),
              iconData: Icons.phone,
              controller: _controllerPhone),
          InputTextWidget(
              labelText: "Número para contato 2",
              formatter: Util.maskPhone(_controllerPhone2.text),
              iconData: Icons.phone_iphone,
              controller: _controllerPhone2),
          InputTextWidget(
              labelText: "Número para contato 3",
              formatter: Util.maskPhone(_controllerPhone3.text),
              iconData: Icons.phone_iphone,
              controller: _controllerPhone3),
          ButtonAction(
              onPressed: () async {
                try {
                  await context.read<ConsumersController>().create(
                      ConsumersModel.fromJson({
                        "full_name": _controllerFullName.text,
                        "email": _controllerEmail.text,
                        "cep": _controllerCep.text,
                        "address": _controllerAddress.text,
                        "phone": _controllerPhone.text,
                        "phone2": _controllerPhone2.text,
                        "phone3": _controllerPhone3.text,
                        "created_at": "${DateTime.now().toLocal()}"
                      }),
                      context);
                  context.read<Navigation>().pageView(const ConsumersView());
                } catch (e) {
                  throw showHandler(
                      context, HandlerException(content: e.toString()));
                }
              },
              icon: const Icon(Icons.check),
              label: const Text("Finalizar cadastro")),
        ],
      ),
    );
  }
}
