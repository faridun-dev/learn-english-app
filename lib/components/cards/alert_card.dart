import 'package:eng_game_app/theme/theme.dart';
import 'package:eng_game_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          Provider.of<ThemeProvider>(context).themeData == lightMode
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.grey,
      title: Text(
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        "Please reveal word translation",
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Back",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
