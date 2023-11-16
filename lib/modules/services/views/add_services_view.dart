import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/modules/services/services_view.dart';
import 'package:oficinar/modules/services/widgets/card_details_consumer.dart';
import 'package:oficinar/widgets/input_text.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';
import 'package:provider/provider.dart';

class ServicesAddView extends StatelessWidget {
  final ConsumersModel consumersModel;
  const ServicesAddView({
    super.key,
    required this.consumersModel,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldRightDashboard(
      appBar: AppBar(
        title: const Text("Abrir ordem de serviço"),
        leading: IconButton(
            onPressed: () {
              context.read<Navigation>().pageView(const ServicesView());
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardDetailsConsumerWidget(consumersModel: consumersModel),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Aparelho',
                style: Theme.of(context).textTheme.displayMedium),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InputTextWidget(
                      labelText: "Aparelho", iconData: Icons.title),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InputTextWidget(
                      labelText: 'Modelo',
                      iconData: Icons.devices_other_outlined),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InputTextWidget(
                      labelText: "Número de série", iconData: Icons.numbers),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InputTextWidget(
                      labelText: 'Marca', iconData: Icons.file_copy),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text('OS 1', style: Theme.of(context).textTheme.displayMedium),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InputTextWidget(
                      labelText: "Aparelho", iconData: Icons.title),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InputTextWidget(
                      labelText: 'Modelo',
                      iconData: Icons.devices_other_outlined),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InputTextWidget(
                      labelText: "Número de série", iconData: Icons.numbers),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InputTextWidget(
                      labelText: 'Marca', iconData: Icons.file_copy),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
