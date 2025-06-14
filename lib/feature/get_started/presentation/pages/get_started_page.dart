import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:waitwing/feature/get_started/presentation/pages/get_started_view.dart';

@RoutePage()
class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetStartedView();
  }
}
