import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GameCard extends StatelessWidget {
  String title;
  void Function()? onPressed;
  bool lock = false;
  GameCard({
    super.key,
    required this.title,
    required this.onPressed,
    required this.lock,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !lock ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 10,
          right: 10,
        ),
        child: Container(
          padding: const EdgeInsets.all(
            30,
          ),
          decoration: BoxDecoration(
            color: !lock
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(
              10,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: !lock
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Icon(
                lock ? Icons.lock_rounded : Icons.lock_open_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
