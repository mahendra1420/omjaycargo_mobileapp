import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException("Connection timeout");
      case DioExceptionType.receiveTimeout:
        return ApiException("Receive timeout");
      case DioExceptionType.badResponse:
        final code = error.response?.statusCode;
        final msg = error.response?.data?['message'] ?? 'Server error';
        return ApiException("[$code] $msg");
      case DioExceptionType.cancel:
        return ApiException("Request cancelled");
      default:
        return ApiException(error.message ?? "Unexpected error occurred");
    }
  }

  @override
  String toString() => message;
}
