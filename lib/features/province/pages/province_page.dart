import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/features/province/providers/province_controller.dart';
import 'package:state_management/features/province/widgets/province_list.dart';
import 'package:state_management/features/province/widgets/province_loader.dart';

class ProvincePage extends StatelessWidget {
  const ProvincePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProvinceController>();

    if(controller.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(controller.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
        controller.clearErrorMessage(); // Clear the error after showing SnackBar
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Indonesia Province')),
      body: controller.isLoading
          ? Center(child: ProvinceLoader())
          : ProvinceList(),
    );
  }
}
