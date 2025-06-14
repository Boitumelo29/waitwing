import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;

  const AuthContainer(
      {super.key, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(width: 1, color: Colors.purple.shade700)),
        child: Center(
          child: Icon(
            iconData,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
