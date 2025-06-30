import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:waitwing/feature/auth/bloc/auth_bloc.dart';

class AppProvider extends StatelessWidget {
  final Widget child;

  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => Get.find<AuthBloc>()
            ..add(CheckAuthStatus())
            ..add(ListenToAuthChanges()))
    ], child: child);
  }
}
