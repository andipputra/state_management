import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/features/home/provider/home_generater_notifier.dart';
import 'package:state_management/features/home/provider/home_notifier.dart';
import 'package:state_management/features/home/widget/decrement_button.dart';
import 'package:state_management/features/home/widget/increment_button.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(homeProvider);
    final newCounter = ref.watch(homeGeneraterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  VerticalDivider(),
                  Text(
                    '$newCounter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            DecrementButton(),
            IncrementButton(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/province');
              },
              child: Text('Go To Province'),
            ),
          ],
        ),
      ),
    );
  }
}
