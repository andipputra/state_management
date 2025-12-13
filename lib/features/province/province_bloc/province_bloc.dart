import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_management/data/models/province_response.dart';
import 'package:state_management/data/repositories/province_repository.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final ProvinceRepository _provinceRepository;

  ProvinceBloc({required ProvinceRepository provinceRepository})
    : _provinceRepository = provinceRepository,
      super(const ProvinceState.initial()) {
    on<ProvinceEvent>((event, emit) async {
      await event.map(getProvince: (value) => _getProvince(emit));
    });
  }

  Future<void> _getProvince(Emitter<ProvinceState> emit) async {
    emit(const ProvinceState.loading());
    try {
      log('Get province');
      final response = await _provinceRepository.getProvince();
      log('Get province success: $response');
      emit(ProvinceState.success(response));
    } catch (e) {
      log('Get province error: $e');
      emit(ProvinceState.error(e.toString()));
    }
  }
}
