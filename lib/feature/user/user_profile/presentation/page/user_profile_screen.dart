import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:waitwing/feature/user/user_profile/presentation/page/user_profile_view.dart';

@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProfileView();
  }
}
