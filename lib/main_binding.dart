import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    /// connection (dio)
    registerDio();
  }

  void registerDio() async {
    final dio = Dio(BaseOptions(baseUrl: 'https://open-api.my.id/api/wilayah'));
    dio.interceptors.add(LogInterceptor());

    Get.put(dio);
  }
}
