import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/features/province/province_bloc/province_bloc.dart';
import 'package:state_management/features/province/widgets/province_item.dart';

class ProvinceList extends StatelessWidget {
  const ProvinceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProvinceBloc, ProvinceState>(
      builder: (context, state) {
        return state.maybeMap(
          success: (loadedState) => ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: loadedState.provinceList.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) =>
                ProvinceItem(province: loadedState.provinceList[index]),
          ),
          orElse: () => Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {
        state.mapOrNull(
          error: (errorMessage) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errorMessage.message)));
          },
        );
      },
    );
  }
}
