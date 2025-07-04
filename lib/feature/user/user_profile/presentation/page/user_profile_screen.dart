import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:waitwing/feature/user/user_profile/bloc/user_bloc.dart';

@RoutePage()
class UserProfileWrapperScreen extends StatelessWidget {
  const UserProfileWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<UserBloc>()
        ..add(LoadUser())
        ..add(FetchUserImage()),
      child: AutoRouter(),
    );
  }
}
