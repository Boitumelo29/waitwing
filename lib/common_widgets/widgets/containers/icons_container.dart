import 'package:flutter/material.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';


class IconsContainer extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final IconData icon;

  const IconsContainer(
      {super.key,
        required this.onPressed,
        required this.title,
        required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: 135,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: context.colorScheme.primary, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Icon(icon), Text(title)],
          )),
    );
  }
}
