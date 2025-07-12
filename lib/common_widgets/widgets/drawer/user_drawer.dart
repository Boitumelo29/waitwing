import 'package:flutter/material.dart';

class UserProfileDrawer extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? onTap;

  const UserProfileDrawer(
      {super.key,
      required this.iconData,
      required this.title,
       this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData),
          title: Text(title),
          trailing: Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ],
    );
  }
}
