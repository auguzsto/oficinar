import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_controller.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/modules/consumers/widgets/details_consumers.dart';
import 'package:provider/provider.dart';

class SearchConsumersWidget extends StatelessWidget {
  const SearchConsumersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isSearch = ValueNotifier<bool>(false);
    final controllerInputText = TextEditingController();
    return Column(
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
                    final consumerModel =
                        ConsumersModel.fromJson(snapshot.data?[index] ?? {});
                    return ListTile(
                      onTap: () => _detailsConsumer(context, consumerModel),
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
              hintText: "Procure cliente por nome completo, pressione o enter",
              prefixIcon: const Icon(Icons.person)),
        ),
      ],
    );
  }
}

void _detailsConsumer(BuildContext context, ConsumersModel consumersModel) {
  Navigator.pop(context);
  context
      .read<Navigation>()
      .pageView(DetailsConsumersView(consumersModel: consumersModel));
}
