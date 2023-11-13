import 'package:flutter/material.dart';
import 'package:oficinar/modules/consumers/consumers_controller.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:provider/provider.dart';

class ListConsumersWidget extends StatelessWidget {
  const ListConsumersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(),
        Text("Recentes", style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: AnimatedBuilder(
            animation: context.watch<ConsumersController>(),
            builder: (context, child) {
              return FutureBuilder(
                future: ConsumersController.getAll(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final consumerModel =
                            ConsumersModel.fromJson(snapshot.data![index]);
                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: CircleAvatar(
                            child: Text(consumerModel.fullName![0]),
                          ),
                          title: Text(consumerModel.fullName!),
                          subtitle: Text(consumerModel.phone!),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: snapshot.data!.length);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
