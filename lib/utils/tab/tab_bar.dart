import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:waitwing/core/routers/router.dart';

@RoutePage()
class TabBarView extends StatefulWidget {
  const TabBarView({super.key});

  @override
  State<TabBarView> createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TabBarView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: [
           HomeRoute(),
          UserProfileRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Person")
                ]),
          );
        });
  }
}
