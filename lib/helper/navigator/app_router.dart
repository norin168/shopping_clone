import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
@LazySingleton()
class AppRouter extends $AppRouter {
  AppRouter._();

  static final AppRouter _instance = AppRouter._();

  factory AppRouter() => _instance;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRouteNew.page, initial: true),
        // main non-login
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: LogoutRoute.page),

        AutoRoute(page: SignupRoute.page),

        // main on login
        AutoRoute(page: HomeRoute.page),
      ];
}

// @RoutePage(name: 'HomeTab')
// class HomeTabPage extends AutoRouter {
//   const HomeTabPage({super.key});
// }

// @RoutePage(name: 'SearchTab')
// class SearchTabPage extends AutoRouter {
//   const SearchTabPage({super.key});
// }

// @RoutePage(name: 'MyPageTab')
// class MyPageTabPage extends AutoRouter {
//   const MyPageTabPage({super.key});
// }
