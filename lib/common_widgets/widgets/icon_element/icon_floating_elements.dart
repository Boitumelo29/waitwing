import 'package:flutter/material.dart';

class IconFloatingElements extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color color;
  final Color? shadowColour;

  const IconFloatingElements(
      {super.key,
      required this.child,
      this.height,
      this.width,
      required this.color,
      this.shadowColour});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: color),
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              color: Theme.of(context).colorScheme.shadow,
              offset: const Offset(-2, 1))
        ],
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: child,
      ),
    );
  }
}
