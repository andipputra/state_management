import 'package:get/get.dart';
import 'package:state_management/data/models/province_response.dart';
import 'package:state_management/data/repositories/province_repository.dart';
import 'package:state_management/features/province/widgets/province_error_snackbar.dart';

class ProvinceController extends GetxController {
  final ProvinceRepository repository;
  ProvinceController(this.repository);

  late String title;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>;
    title = args['title'] as String;

    getProvince();
  }


  final isProvinceLoading = false.obs;
  final RxList<ProvinceResponse> provinceList = <ProvinceResponse>[].obs;

  Future<void> getProvince() async {
    isProvinceLoading.value = true;

    try {
      final data = await repository.getProvince();
      provinceList.assignAll(data);
    } catch (e) {
      Get.showSnackbar(ProvinceErrorSnackbar());
    } finally {
      isProvinceLoading.value = false;
    }
  }
}
