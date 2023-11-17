import 'package:flutter/material.dart';
import 'package:oficinar/core/navigation.dart';
import 'package:oficinar/modules/consumers/consumers_controller.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';
import 'package:oficinar/modules/consumers/widgets/details_consumers.dart';
import 'package:oficinar/widgets/alert_sucess.dart';
import 'package:oficinar/widgets/handler_exception.dart';
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
                future: ConsumersController.getByLastAdded(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final consumerModel =
                            ConsumersModel.fromJson(snapshot.data![index]);
                        return ListTile(
                          onTap: () => _detailsConsumer(context, consumerModel),
                          contentPadding: const EdgeInsets.all(0),
                          leading: CircleAvatar(
                            child: Text(consumerModel.fullName![0]),
                          ),
                          title: Text(consumerModel.fullName!),
                          subtitle: Text(consumerModel.phone!),
                          trailing: IconButton(
                              onPressed: () {
                                _dialog(context, consumerModel);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).colorScheme.error,
                              )),
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

void _dialog(BuildContext context, ConsumersModel consumersModel) {
  showHandler(
    context,
    HandlerException(
      content: "Ao confirmar esta ação, você irá apagar este cliente",
      textRightButton: "Não desejo apagar",
      rightOnPressed: () => Navigator.pop(context),
      textLeftButton: "Desejo apagar",
      leftOnPressed: () => _delete(context, consumersModel),
    ),
  );
}

Future<void> _delete(
    BuildContext context, ConsumersModel consumersModel) async {
  try {
    context.read<ConsumersController>().delete(consumersModel, context);
    Navigator.pop(context);
    showSuccess(context);
  } catch (e) {
    throw showHandler(context, HandlerException(content: e.toString()));
  }
}

void _detailsConsumer(BuildContext context, ConsumersModel consumersModel) {
  context
      .read<Navigation>()
      .pageView(DetailsConsumersView(consumersModel: consumersModel));
}
