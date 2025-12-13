import 'package:bloc/bloc.dart';

class HomeNewCubit extends Cubit<int> {
  HomeNewCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
