import 'package:flutter/material.dart';

class LongRectangleButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool shouldHaveColor;
  final Color? color;

  const LongRectangleButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.shouldHaveColor = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 380,
          height: 60,
          decoration: BoxDecoration(
            color: shouldHaveColor ? color : Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(title),
          ),
        ));
  }
}
