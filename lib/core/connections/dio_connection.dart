import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_connection.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio();
  dio.options.baseUrl = 'https://open-api.my.id/api/wilayah';
  dio.interceptors.add(LogInterceptor(
    request: true,
    responseBody: true,
    responseHeader: true,
    error: true,
  ));

  return dio;
}