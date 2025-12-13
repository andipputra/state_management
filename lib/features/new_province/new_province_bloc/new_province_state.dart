part of 'new_province_bloc.dart';

sealed class NewProvinceState {}

class NewProvinceInitial extends NewProvinceState {}

class NewProvinceLoading extends NewProvinceState {}

class NewProvinceSuccess extends NewProvinceState {
  final List<ProvinceResponse> provinceResponses;
  NewProvinceSuccess(this.provinceResponses);
}

class NewProvinceError extends NewProvinceState {
  final String errorMessage;
  NewProvinceError(this.errorMessage);
}
