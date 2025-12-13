import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/features/province/province_bloc/province_bloc.dart';
import 'package:state_management/features/province/widgets/province_list.dart';

class ProvincePage extends StatefulWidget {
  const ProvincePage({super.key});

  @override
  State<ProvincePage> createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProvinceBloc>().add(ProvinceEvent.getProvince());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Indonesia Province')),
      body: ProvinceList(),
    );
  }
}
