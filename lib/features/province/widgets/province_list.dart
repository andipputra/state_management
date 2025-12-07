import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/features/province/providers/province_controller.dart';
import 'package:state_management/features/province/providers/province_notifier.dart';
import 'package:state_management/features/province/widgets/province_item.dart';

class ProvinceList extends ConsumerWidget {
  const ProvinceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provinceValue = ref.watch(provinceProvider);

    final provinceList = provinceValue.value ?? [];

    if (provinceList.isEmpty) {
      return Center(
        child: Text(
          'No province found',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return Column(
      children: [
        FilledButton(
          onPressed: () => ref.invalidate(provinceProvider),
          child: Text('Refresh Data'),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: provinceList.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) =>
                ProvinceItem(province: provinceList[index]),
          ),
        ),
      ],
    );
  }
}
