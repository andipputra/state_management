import 'package:flutter/material.dart';
import 'package:state_management/data/models/province_response.dart';

class ProvinceInheritedWidget extends InheritedWidget {
  final List<ProvinceResponse> provinceList;
  final bool isLoading;
  final VoidCallback refreshDataList;

  const ProvinceInheritedWidget({
    super.key,
    required super.child,
    required this.provinceList,
    required this.isLoading,
    required this.refreshDataList,
  });

  @override
  bool updateShouldNotify(ProvinceInheritedWidget oldWidget) {
    return isLoading != oldWidget.isLoading;
  }
}
