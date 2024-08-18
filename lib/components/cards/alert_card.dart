import 'package:eng_game_app/components/constants.dart';
import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Please reveal word translation",
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Back",
            style: TextStyle(
              color: appBarColor,
            ),
          ),
        ),
      ],
    );
  }
}
