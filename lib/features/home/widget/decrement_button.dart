import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/features/home/provider/home_controller.dart';

class DecrementButton extends StatelessWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: context.read<HomeController>().decrement,
      child: Text('Decrement'),
    );
  }
}
