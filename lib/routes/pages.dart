import 'package:get/get.dart';
import 'package:state_management/features/home/pages/home_page.dart';
import 'package:state_management/features/province/bindings/province_binding.dart';
import 'package:state_management/features/province/pages/province_page.dart';

abstract class AppPages {
  static const home = '/home';
  static const province = '/province';

  static final pages = [
    GetPage(name: home, page: () => MyHomePage()),
    GetPage(
      name: province,
      page: () => ProvincePage(),
      transition: Transition.upToDown,
      transitionDuration: Duration(milliseconds: 500),
      binding: ProvinceBinding(),
    ),
  ];
}
