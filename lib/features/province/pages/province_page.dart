import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/features/province/providers/province_controller.dart';
import 'package:state_management/features/province/providers/province_notifier.dart';
import 'package:state_management/features/province/widgets/province_list.dart';
import 'package:state_management/features/province/widgets/province_loader.dart';

class ProvincePage extends ConsumerWidget {
  const ProvincePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    

    ref.listen(provinceProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    final provinceValue = ref.watch(provinceProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Indonesia Province')),
      body: provinceValue.maybeWhen(
        data: (data) => ProvinceList(),
        orElse: () => Center(child: ProvinceLoader()),
      ),
    );
  }
}
