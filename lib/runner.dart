import 'dart:async';

import 'package:flutter/material.dart';
import 'package:w_navigator/app/app.dart';
import 'package:w_navigator/helper/config/app_config.dart';
import 'package:w_navigator/helper/config/env_config.dart';
import 'package:w_navigator/helper/log/log.dart';

Future<void>? run(FlutterDotenvType env) =>
    runZonedGuarded(() => _runMyApp(env), _reportError);

Future<void> _runMyApp(env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppConfig.instance.config(env);

  runApp(const MyApp());
}

void _reportError(Object error, StackTrace stackTrace) {
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // report by Firebase Crashlytics here
}

// Future<LoadInitialResourceOutput> _loadInitialResource() async {
//   final result = runCatching(
//     action: () =>
//         GetIt.instance.get<LoadInitialResourceUseCase>().execute(const LoadInitialResourceInput()),
//   );

//   return result.when(
//     success: (output) => output,
//     failure: (e) => const LoadInitialResourceOutput(),
//   );
// }
