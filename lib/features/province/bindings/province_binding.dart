import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:state_management/data/repositories/province_repository.dart';
import 'package:state_management/features/province/controller/province_controller.dart';

class ProvinceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProvinceRepository(Get.find<Dio>()));
    Get.lazyPut(() => ProvinceController(Get.find<ProvinceRepository>()));
  }
}
 