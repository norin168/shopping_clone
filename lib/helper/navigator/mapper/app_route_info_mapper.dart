import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/helper/navigator/app_router.gr.dart';
import 'package:w_navigator/helper/navigator/info/app_route_info.dart';
import 'package:w_navigator/helper/navigator/mapper/mapper_base.dart';

@Singleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo info) {
    switch (info) {
      case HomeInfo home:
        return HomeRoute(title: home.title);
      case SplashInfo _:
        return const SplashRouteNew();
      case LoginInfo _:
        return const LoginRoute();
      case LogoutInfo _:
        return const LogoutRoute();
      case SignUpInfo _:
        return const SignupRoute();
    }
  }
}
