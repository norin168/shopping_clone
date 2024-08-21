import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_di.config.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  FlutterSecureStorage get secureStorage => FlutterSecureStorage(
        iOptions: getIOSOptions,
        aOptions: _getAndroidOptions,
      );

  IOSOptions get getIOSOptions => const IOSOptions(
        accountName: 'app_secure_storage',
        accessibility: KeychainAccessibility.first_unlock,
      );

  AndroidOptions get _getAndroidOptions => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Connectivity get connectivity => Connectivity();
  // firebase
}

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> appDI() => getIt.init();
