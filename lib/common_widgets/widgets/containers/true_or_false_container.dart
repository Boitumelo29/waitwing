import 'package:flutter/material.dart';

class TrueOrFalseContainer extends StatelessWidget {
  final bool shouldBeRed;
  final bool shouldBeTrue;
  final Function() onTap;

  const TrueOrFalseContainer(
      {super.key,
      required this.shouldBeRed,
      required this.onTap,
      required this.shouldBeTrue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 350,
        decoration: BoxDecoration(
          color: shouldBeRed ? Colors.green : Colors.green,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Text(
            shouldBeTrue ? "True" : "False",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
