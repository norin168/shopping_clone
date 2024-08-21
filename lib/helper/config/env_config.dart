import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class EnvConfig {
  String get baseUrl => dotenv.get('baseUrl', fallback: '');

  String get envName => dotenv.get('name', fallback: '');

  String get googleMapApiKey => dotenv.get('googleMapApiKey', fallback: '');
}

enum FlutterDotenvType {
  dev(
    name: 'Develop',
    path: 'assets/.env/dev.env',
  ),

  staging(
    name: 'Staging',
    path: 'assets/.env/staging.env',
  ),

  prod(
    name: 'Production',
    path: 'assets/.env/prod.env',
  );

  const FlutterDotenvType({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
