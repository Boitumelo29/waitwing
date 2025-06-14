import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:waitwing/common_widgets/widgets/buttons/long_button.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/core/routers/router.dart';
import 'package:waitwing/gen/assets.gen.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.loc.waitWing,
              style: context.textTheme.headlineLarge
                  ?.copyWith(color: Colors.purple),
            ),
            Text(
              context.loc.waitWingSub,
              style: context.textTheme.headlineMedium
                  ?.copyWith(color: Colors.grey),
            ),
            Image.asset(
              Assets.lib.assets.queueLogo.path,
              height: 400,
              width: 400,
            ),
            Text(
              context.loc.waitWingQueueSystem,
              style: context.textTheme.bodyLarge?.copyWith(color: Colors.black),
            ),
            SizedBox(
              width: 300,
              child: LongButton(
                  onTap: () {
                    context.router.push(UserRegistrationRoute());
                  },
                  title: context.loc.getStarted,
                  isLoading: false),
            )
          ],
        ),
      ),
    );
  }
}
