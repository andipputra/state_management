import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = NotifierProvider.autoDispose<HomeNotifier, int>(
  HomeNotifier.new,
);

class HomeNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state++;
  void decrement() => state--;
}
