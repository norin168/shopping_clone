sealed class AppRouteInfo {
  const AppRouteInfo._();

  const factory AppRouteInfo.home({required String title}) = HomeInfo;
  const factory AppRouteInfo.login() = LoginInfo;
  const factory AppRouteInfo.splash() = SplashInfo;
  const factory AppRouteInfo.logout() = LogoutInfo;
  const factory AppRouteInfo.singUp() = SignUpInfo;
}

class HomeInfo extends AppRouteInfo {
  final String title;
  const HomeInfo({required this.title}) : super._();
}

class LoginInfo extends AppRouteInfo {
  const LoginInfo() : super._();
}

class SplashInfo extends AppRouteInfo {
  const SplashInfo() : super._();
}

class LogoutInfo extends AppRouteInfo {
  const LogoutInfo() : super._();
}

class SignUpInfo extends AppRouteInfo {
  const SignUpInfo() : super._();
}
