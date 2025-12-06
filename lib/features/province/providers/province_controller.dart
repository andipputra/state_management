import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_management/data/models/province_response.dart';
import 'package:state_management/data/repositories/province_repository.dart';

class ProvinceController extends ChangeNotifier {
  final ProvinceRepository provinceRepository;

  ProvinceController(this.provinceRepository) {
    getProvince();
  }

  final List<ProvinceResponse> provinceList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getProvince() async {
    isLoading = true;
    notifyListeners();

    try {
      final provinceListResponse = await provinceRepository.getProvince();

      if (provinceListResponse.isNotEmpty) {
        provinceList.clear();
        provinceList.addAll(provinceListResponse);
      }

      log('Province list: $provinceList');
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  clearErrorMessage() {
    errorMessage = null;
    notifyListeners();
  }
}
