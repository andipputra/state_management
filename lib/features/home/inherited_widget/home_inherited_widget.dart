import 'package:flutter/material.dart';

class HomeInheritedWidget extends InheritedWidget {
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const HomeInheritedWidget({
    super.key,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
    required super.child,
  });

  @override
  bool updateShouldNotify(HomeInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
  }
}
