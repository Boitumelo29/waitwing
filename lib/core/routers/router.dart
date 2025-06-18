import 'package:auto_route/auto_route.dart';
import 'package:waitwing/feature/get_started/presentation/pages/get_started_page.dart';
import 'package:waitwing/feature/home/presentation/page/home_page.dart';
import 'package:waitwing/feature/user/user_registration/presentation/pages/user_registration_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: GetStartedRoute.page, path: '/getStarted', initial: true),
        AutoRoute(page: UserRegistrationRoute.page, path: '/userRegistration'),
    AutoRoute(page: HomeRoute.page, path: '/home',),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);
  }
}
