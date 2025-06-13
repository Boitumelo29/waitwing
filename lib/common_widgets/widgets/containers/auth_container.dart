import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function() onPressed;

  const AuthContainer(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 175,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(width: 1, color: Colors.grey.shade700)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.grey.shade700,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
