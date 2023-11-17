import 'package:flutter/material.dart';

class ListDetailsServicesConsumerWidget extends StatelessWidget {
  const ListDetailsServicesConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text("15487",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                )),
          ),
          title: const Text("TV 32 LED - LG"),
          subtitle: Text(
            "PARADA, NÃO LIGA",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Aguardando avaliação",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
              ),
            ),
          ),
        );
      },
    );
  }
}
