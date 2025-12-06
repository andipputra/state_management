import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/features/home/provider/home_controller.dart';
import 'package:state_management/features/home/widget/decrement_button.dart';
import 'package:state_management/features/home/widget/increment_button.dart';
import 'package:state_management/features/province/pages/province_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

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
            Text(
              '${controller.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            DecrementButton(),
            IncrementButton(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ProvincePage()));
              },
              child: Text('Go To Province'),
            ),
          ],
        ),
      ),
    );
  }
}
