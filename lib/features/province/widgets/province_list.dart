import 'package:flutter/material.dart';
import 'package:state_management/features/province/inherited_widget/province_inherited_widget.dart';
import 'package:state_management/features/province/widgets/province_item.dart';

class ProvinceList extends StatelessWidget {
  const ProvinceList({super.key});

  @override
  Widget build(BuildContext context) {
    final ProvinceInheritedWidget? provinceInheritedWidget = context
        .dependOnInheritedWidgetOfExactType<ProvinceInheritedWidget>();

    final provinceList = provinceInheritedWidget?.provinceList ?? [];

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
          onPressed: provinceInheritedWidget?.refreshDataList,
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
