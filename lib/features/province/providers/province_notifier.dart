import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/data/models/province_response.dart';
import 'package:state_management/data/repositories/province_repository.dart';

part 'province_notifier.g.dart';

@riverpod
class ProvinceNotifier extends _$ProvinceNotifier {
  @override
  FutureOr<List<ProvinceResponse>> build() async {
    try {
      state = AsyncLoading();

      final repository = ref.read(provinceRepositoryProvider);

      final response = await repository.getProvince();

      if(response.isEmpty){
        state = AsyncError('No province found', StackTrace.current);
      }

      return response;
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
      return [];
    }
  }

  Future<void> refreshProvince() async {
    state = AsyncLoading();

    try {
      final repository = ref.read(provinceRepositoryProvider);

      final response = await repository.getProvince();

      if(response.isEmpty){
        state = AsyncError('No province found', StackTrace.current);
      }

      state = AsyncData(response);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}