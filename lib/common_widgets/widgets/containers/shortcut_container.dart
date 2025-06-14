import 'package:flutter/material.dart';

class ShortCutContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const ShortCutContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 85,
        width: 85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green, width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.green,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
