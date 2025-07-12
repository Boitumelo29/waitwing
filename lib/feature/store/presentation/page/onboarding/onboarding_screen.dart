import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:waitwing/feature/store/bloc/onboarding/onboarding_bloc.dart';
import 'package:waitwing/feature/store/presentation/page/onboarding/onboarding.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<OnboardingBloc>(),
      child: OnboardingView(),
    );
  }
}
