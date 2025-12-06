import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/features/home/provider/home_controller.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: context.read<HomeController>().increment,
      child: Text('Increment'),
    );
  }
}
