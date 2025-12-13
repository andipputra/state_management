import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/data/models/province_response.dart';
import 'package:state_management/data/repositories/province_repository.dart';

part 'new_province_event.dart';
part 'new_province_state.dart';

class NewProvinceBloc extends Bloc<NewProvinceEvent, NewProvinceState> {
  final ProvinceRepository _provinceRepository;

  NewProvinceBloc({required ProvinceRepository provinceRepository})
    : _provinceRepository = provinceRepository,
      super(NewProvinceInitial()) {
    on<NewProvinceEvent>((event, emit) async {
      if (event is NewProvinceFetch) {
        emit(NewProvinceLoading());
        try {
          final provinceResponses = await _provinceRepository.getProvince();
          emit(NewProvinceSuccess(provinceResponses));
        } catch (e) {
          emit(NewProvinceError(e.toString()));
        }
      }
    });
  }
}
