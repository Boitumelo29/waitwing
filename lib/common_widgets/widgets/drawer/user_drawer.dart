import 'package:flutter/material.dart';

class UserProfileDrawer extends StatelessWidget {
  final IconData iconData;
  final String title;

  const UserProfileDrawer(
      {super.key, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData),
          title: Text(title),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}