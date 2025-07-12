import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/common_widgets/widgets/buttons/long_button.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/core/routers/router.dart';
import 'package:waitwing/feature/store/bloc/onboarding/onboarding_bloc.dart';
import 'package:waitwing/feature/store/presentation/widget/name_content.dart';
import 'package:waitwing/feature/store/presentation/widget/search_content.dart';
import 'package:waitwing/feature/store/presentation/widget/service_content.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentIndex = 0;
  final int _totalScreens = 3;

  final List<Widget> _pages = [
    NameContent(),
    ServiceContent(),
    SearchContent(),
  ];

  void _nextPage() {
    if (_currentIndex < _totalScreens - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      context.router.replace(StoreRoute());
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    } else {
      context.router.pop();
    }
  }

  Widget _buildProgressBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_totalScreens, (index) {
        final isActive = index <= _currentIndex;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: 70,
          decoration: BoxDecoration(
            color: isActive ? context.colorScheme.primary : Colors.grey[300],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              spacing: 10,
              children: [
                const SizedBox(width: 38),
                Row(
                  children: [
                    if (_currentIndex > 0)
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: _previousPage,
                      ),
                    Expanded(child: _buildProgressBar(context)),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(child: _pages[_currentIndex]),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LongButton(
                    onTap: _nextPage,
                    title: _currentIndex == _totalScreens - 1
                        ? context.loc.finish
                        : context.loc.next,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
