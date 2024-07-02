import 'package:dio/dio.dart';
import 'package:nutri_kit/core/interceptor/dio_interceptor.dart';

class ApiInterceptor {
  static Dio apiInstance() {
    Dio dio = Dio();
    dio.interceptors.add(DioInterceptor());
    return dio;
  }
}
