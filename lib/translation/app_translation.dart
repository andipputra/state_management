import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
      'welcoming': "Hello Welcome to State Management",
    },
    'id_ID': {
      'hello': 'Halo',
      'welcoming': "Halo Selamat Datang di State Management",
    },
  };
}