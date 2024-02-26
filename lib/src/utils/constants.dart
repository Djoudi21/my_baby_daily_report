import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String? baseUrl = dotenv.env['API_URL'];
  static String? loginEndpoint = 'api/v1/login';
  static String? registerEndpoint = 'api/v1/register';
}
