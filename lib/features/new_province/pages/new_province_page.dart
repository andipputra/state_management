import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/features/new_province/new_province_bloc/new_province_bloc.dart';
import 'package:state_management/features/province/widgets/province_item.dart';

class NewProvincePage extends StatelessWidget {
  const NewProvincePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Indonesia Province')),
      body: BlocBuilder<NewProvinceBloc, NewProvinceState>(
        builder: (context, state) {
          if (state is NewProvinceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewProvinceSuccess) {
            return ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: state.provinceResponses.length,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) =>
                  ProvinceItem(province: state.provinceResponses[index]),
            );
          } else if (state is NewProvinceError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: Text('It Initial'));
          }
        },
      ),
    );
  }
}
