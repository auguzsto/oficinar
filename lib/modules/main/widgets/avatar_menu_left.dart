import 'package:flutter/material.dart';
import 'package:oficinar/injector_depency.dart';
import 'package:oficinar/modules/users/user_model.dart';

class AvatarMenuLeft extends StatelessWidget {
  AvatarMenuLeft({super.key});

  final userModel = getDep.get<UserModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          maxRadius: MediaQuery.of(context).size.height / 10,
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            userModel.username![0].toUpperCase(),
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.displayLarge!.fontSize),
          ),
        ),
      ),
    );
  }
}
