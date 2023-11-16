import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/services/services_view.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';
import 'package:provider/provider.dart';

class AddServicesView extends StatelessWidget {
  const AddServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRightDashboard(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => context.read<Navigation>().pageView(
                    const ServicesView(),
                  ),
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Abrir ordem de serviço")),
      body: Column(
        children: [],
      ),
    );
  }
}
