import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    ever(counter, showEvenAndOdd);
  }

  void showEvenAndOdd(int value) {
    final String message = value % 2 == 0 ? 'Even' : 'Odd';
    Get.snackbar('Counter', message);
  }

  final counter = 0.obs;

  void incrementCounter() {
    counter.value++;
    update();
  }

  void decrementCounter() {
    counter.value--;
    update();
  }
}
