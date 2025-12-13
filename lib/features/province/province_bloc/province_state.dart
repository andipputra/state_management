part of 'province_bloc.dart';

@freezed
sealed class ProvinceState with _$ProvinceState {
  const factory ProvinceState.initial() = _Initial;
  const factory ProvinceState.loading() = _Loading;
  const factory ProvinceState.success(List<ProvinceResponse> provinceList) =
      _Success;
  const factory ProvinceState.error(String message) = _Error;
}
