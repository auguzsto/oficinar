import 'package:flutter/material.dart';
import 'package:oficinar/modules/consumers/consumers_model.dart';

class CardDetailsConsumerWidget extends StatelessWidget {
  final ConsumersModel consumersModel;
  const CardDetailsConsumerWidget({
    super.key,
    required this.consumersModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width / 25,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Text(
                    consumersModel.fullName![0],
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  consumersModel.fullName!,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Row(
                  children: [
                    Text(
                      consumersModel.phone!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      consumersModel.email!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Text(
                  consumersModel.address!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
