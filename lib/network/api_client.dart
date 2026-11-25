import 'package:dio/dio.dart';
import '../data/shared_preference.dart';
import '../helpers/app_url.dart';
import 'api_exception.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppUrl.baseURL,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 60), // ⏳ increased timeout
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<dynamic> post(String endpoint, dynamic data, {bool useToken = true}) async {
    try {
      String? token;
      if (useToken) {
        token = await PreferenceManager.getAccessToken();
        if (token != null && token.isNotEmpty) {
          _dio.options.headers['Authorization'] = 'Bearer $token';
        } else {
          print('⚠️ No token found in SharedPreferences');
        }
      }

      print('🟦 [API REQUEST]');
      print('➡️ URL: ${_dio.options.baseUrl}$endpoint');
      print('🧾 Headers: ${_dio.options.headers}');
      print('📦 Body: $data');

      Response response = await _sendWithRetry(endpoint, data);

      print('🟩 [API RESPONSE]');
      print('✅ Status Code: ${response.statusCode}');
      print('📥 Data: ${response.data}');

      return response.data;
    } on DioException catch (e) {
      print('🟥 [API ERROR]');
      print('❌ Type: ${e.type}');
      print('📄 Message: ${e.message}');
      print('📤 Request URL: ${e.requestOptions.uri}');
      if (e.response != null) {
        print('📥 Response: ${e.response?.data}');
      }

      throw ApiException.fromDioError(e);
    }
  }

  Future<Response> _sendWithRetry(String endpoint, dynamic data, {int retries = 2}) async {
    int attempt = 0;
    while (true) {
      try {
        return await _dio.post(endpoint, data: data);
      } on DioException catch (e) {
        if (e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.connectionTimeout) {
          attempt++;
          if (attempt <= retries) {
            print('⚠️ Timeout occurred. Retrying... ($attempt/$retries)');
            await Future.delayed(const Duration(seconds: 2)); // wait before retry
            continue;
          }
        }
        rethrow;
      }
    }
  }
}
