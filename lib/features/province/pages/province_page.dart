import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/features/province/controller/province_controller.dart';
import 'package:state_management/features/province/widgets/province_item.dart';
import 'package:state_management/features/province/widgets/province_loader.dart';

class ProvincePage extends GetResponsiveView<ProvinceController> {
  ProvincePage({super.key});

  @override
  Widget? tablet() => Container();

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(title: Text(controller.title)),
      body: Obx(() {
        if (controller.isProvinceLoading.value) {
          return Center(child: ProvinceLoader());
        }

        if (controller.provinceList.isEmpty) {
          return Center(
            child: Text(
              'No province found',
              style: Theme.of(screen.context).textTheme.bodyMedium,
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.all(16),
          itemCount: controller.provinceList.length,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) =>
              ProvinceItem(province: controller.provinceList[index]),
        );
      }),
    );
  }
}
