import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/feature/user/user_registration/bloc/user_registration_bloc.dart';
import 'package:waitwing/feature/user/user_registration/presentation/pages/user_registration_view.dart';

@RoutePage()
class UserRegistrationPage extends StatelessWidget {
  const UserRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegistrationBloc(),
      child: UserRegistrationView(),
    );
  }
}
