import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/features/home/provider/home_generater_notifier.dart';
import 'package:state_management/features/home/provider/home_notifier.dart';

class IncrementButton extends ConsumerWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homeProvider.notifier);
    final homeGeneratedNotifier = ref.read(homeGeneraterProvider.notifier);

    return FilledButton.tonal(
      onPressed: () {
        notifier.increment();
        homeGeneratedNotifier.increment();
      },
      child: Text('Increment'),
    );
  }
}
