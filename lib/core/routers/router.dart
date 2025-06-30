import 'package:auto_route/auto_route.dart';
import 'package:waitwing/feature/get_started/presentation/pages/get_started_page.dart';
import 'package:waitwing/feature/home/presentation/page/home_page.dart';
import 'package:waitwing/feature/splash_screen/splash_screen.dart';
import 'package:waitwing/feature/user/user_profile/presentation/page/user_profile_screen.dart';
import 'package:waitwing/feature/user/user_registration/presentation/pages/user_registration_page.dart';
import 'package:waitwing/utils/tab/tab_bar.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: SplashRoute.page, path: '/splashPage', initial: true),
    AutoRoute(
            page: GetStartedRoute.page, path: '/getStarted', ),
        AutoRoute(
            page: UserRegistrationRoute.page,
            path: '/userRegistration',
            guards: [AuthGuard()]),
        AutoRoute(page: TabBarRoute.page, path: '/tabBarRoute', children: [
          AutoRoute(page: HomeRoute.page, path: 'homeRoute'),
          AutoRoute(page: UserProfileRoute.page, path: 'userProfileRoute'),
        ], guards: [
          AuthGuard()
        ]),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);
  }
}
