import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/core/connections/dio_connection.dart';
import 'package:state_management/data/models/province_response.dart';

part 'province_repository.g.dart';

@riverpod
ProvinceRepository provinceRepository(Ref ref) =>
    ProvinceRepository(ref.read(dioProvider));

class ProvinceRepository {
  final Dio dio;
  const ProvinceRepository(this.dio);

  Future<List<ProvinceResponse>> getProvince() async {
    try {
      final response = await dio.get('/provinces');

      log('Province response: $response');

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is List) {
          final dataList = responseData.map((item) {
            if (item is Map<String, dynamic>) {
              return ProvinceResponse.fromJson(item);
            }

            return null;
          }).toList();

          final provinceList = dataList.whereType<ProvinceResponse>().toList();

          if (provinceList.isEmpty) {
            throw Exception('Failed: Province is Empty');
          }

          return provinceList;
        }
      }

      throw Exception('Failed: Province is Empty');
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }
}
