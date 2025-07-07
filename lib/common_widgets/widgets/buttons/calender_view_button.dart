import 'package:flutter/material.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';

class CalendarViewButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool selected;

  const CalendarViewButton(
      {super.key,
        required this.onTap,
        required this.title,
        required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: selected
                ? Border(
                bottom: BorderSide(
                  color: context.colorScheme.primary,
                  width: 2,
                ))
                : null),
        child: Center(
            child: Text(
              title,
              style: context.textTheme.headlineMedium,
            )),
      ),
    );
  }
}