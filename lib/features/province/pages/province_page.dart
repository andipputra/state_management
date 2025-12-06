import 'package:flutter/material.dart';
import 'package:state_management/data/models/province_response.dart';
import 'package:state_management/data/repositories/province_repository.dart';
import 'package:state_management/features/province/inherited_widget/province_inherited_widget.dart';
import 'package:state_management/features/province/widgets/province_list.dart';
import 'package:state_management/features/province/widgets/province_loader.dart';

class ProvincePage extends StatefulWidget {
  const ProvincePage({super.key});

  @override
  State<ProvincePage> createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  bool _isLoading = false;
  final List<ProvinceResponse> _provinceList = [];

  Future<void> _getProvinces() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final provinceRepository = ProvinceRepository();
      final provinceList = await provinceRepository.getProvince();

      if (provinceList.isNotEmpty) {
        _provinceList.clear();
        _provinceList.addAll(provinceList);
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _getProvinces();
  }

  @override
  Widget build(BuildContext context) {
    return ProvinceInheritedWidget(
      provinceList: _provinceList,
      isLoading: _isLoading,
      refreshDataList: _getProvinces,
      child: Scaffold(
        appBar: AppBar(title: Text('Indonesia Province')),
        body: _isLoading
            ? Center(child: ProvinceLoader())
            : ProvinceList(),
      ),
    );
  }
}
