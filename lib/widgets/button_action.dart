import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {},
        icon: Icon(Icons.check),
        label: Text("This button"),
      ),
    );
  }
}
