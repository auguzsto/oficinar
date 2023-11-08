import 'package:flutter/material.dart';
import 'package:oficinar/modules/logs/logger_controller.dart';
import 'package:oficinar/modules/logs/logger_model.dart';
import 'package:oficinar/widgets/scaffold_right_dashboard.dart';

class LoggerView extends StatelessWidget {
  const LoggerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldRightDashboard(
      appBar: AppBar(
        title: const Text('Registro geral de ações'),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: LoggerController.getAll(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.1,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final loggerModel =
                        LoggerModel.fromJson(snapshot.data?[index] ?? {});

                    return ListTile(
                      title: Row(
                        children: [
                          Expanded(child: Text(loggerModel.author)),
                          Expanded(child: Text(loggerModel.describe)),
                          Text(loggerModel.createdAt!),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
