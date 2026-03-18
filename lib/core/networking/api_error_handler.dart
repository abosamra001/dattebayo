import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handle(Object error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else {
      return 'Unexpected error occurred!';
    }
  }

  static String _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection time is out!';
      case DioExceptionType.sendTimeout:
        return 'Sending time is out!';
      case DioExceptionType.receiveTimeout:
        return 'Receiving time is out!';
      case DioExceptionType.badCertificate:
        return 'Bad Certification!';
      case DioExceptionType.badResponse:
        return _handleStatusCode(e.response?.statusCode);
      case DioExceptionType.cancel:
        return 'The Request was canceled!';
      case DioExceptionType.connectionError:
        return 'Failed while connecting with the server!';
      case DioExceptionType.unknown:
        return 'Unknown error occurred!';
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request!';
      case 401:
        return 'Unauthorized!';
      case 403:
        return 'Forbidden!';
      case 404:
        return 'Resource not found!';
      case 429:
        return 'Too many requests!';
      case 500:
        return 'Internal server error!';
      case 503:
        return 'Service unavailable!';
      default:
        return 'Something went wrong! (${statusCode ?? '?'})';
    }
  }
}
