import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseAPIURL = dotenv.get('BASE_URL');
  static Map<String, dynamic> defaultHeader = {
    'User-Agent': 'YourAppName/1.0.0',
    'Accept': 'application/json',
  };
  static const Duration receiveTimeout = Duration(seconds: 60);
  static const Duration connectTimeout = Duration(seconds: 60);
}
