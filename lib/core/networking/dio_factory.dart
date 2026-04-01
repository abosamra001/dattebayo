import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _instance;

  static Future<Dio> getDio() async {
    if (_instance != null) {
      return _instance!;
    }
    const timeOut = Duration(seconds: 30);
    _instance = Dio()
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;

    _instance!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: false,
      ),
    );
    return _instance!;
  }
}
