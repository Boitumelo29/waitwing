import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/feature/store/bloc/onboarding/onboarding_bloc.dart';
import 'package:waitwing/feature/store/data/google_places_service.dart';
import 'package:waitwing/feature/store/presentation/page/onboarding/onboarding.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(GooglePlacesService(
          apiKey: "AIzaSyDmcp120kJ2G-2G4A-EATb2WaQ1WdbPPCs")),
      child: OnboardingView(),
    );
  }
}
