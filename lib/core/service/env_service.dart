import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  static late final Map<String, String> _env;

  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
    _env = dotenv.env;
  }

  static String get(String key) {
    return _env[key] ?? '';
  }
}
