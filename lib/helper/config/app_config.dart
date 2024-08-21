import 'package:async/async.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:w_navigator/helper/config/env_config.dart';
import 'package:w_navigator/helper/di/app_di.dart';

abstract interface class Config {
  final AsyncMemoizer<void> _asyncMemoizer = AsyncMemoizer<void>();

  Future<void> config(FlutterDotenvType env);

  Future<void> init() => _asyncMemoizer.runOnce(() => config);
}

// app config impl class
class AppConfig extends Config {
  factory AppConfig.getInstance() => _instance;

  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  static AppConfig get instance => AppConfig.getInstance();

  @override
  Future<void> config(FlutterDotenvType env) async {
    // app init here
    await appDI();

    // do sth here
    await dotenv.load(fileName: env.path);
  }
}
