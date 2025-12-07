import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_generater_notifier.g.dart';

@riverpod
class HomeGeneraterNotifier extends _$HomeGeneraterNotifier {
  @override
  int build() => 0;

  void increment() => state++;
  void decrement() => state--;
}