import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProvinceErrorSnackbar extends GetSnackBar {
  const ProvinceErrorSnackbar({super.key}) : super(
    message: 'Failed: Province is Empty',
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 2),
  );
}
