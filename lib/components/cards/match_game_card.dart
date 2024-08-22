import 'package:eng_game_app/components/styles.dart';
import 'package:flutter/material.dart';

class MatchGameCard extends StatelessWidget {
  const MatchGameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Container(
          width: double.infinity,
          decoration: matchGameCardBoxDecoration,
          child: const Center(child: Text("Hello")),
        ),
      ),
    );
  }
}
