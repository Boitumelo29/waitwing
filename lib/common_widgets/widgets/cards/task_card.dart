import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Widget> children;

  const TaskCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}


