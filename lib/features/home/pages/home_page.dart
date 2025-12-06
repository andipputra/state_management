import 'package:flutter/material.dart';
import 'package:state_management/features/home/inherited_widget/home_inherited_widget.dart';
import 'package:state_management/features/province/pages/province_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return HomeInheritedWidget(
      counter: _counter,
      child: HomeView(),
      onDecrement: () => setState(() => _counter--),
      onIncrement: () => setState(() => _counter++),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeInheritedWidget = context
        .dependOnInheritedWidgetOfExactType<HomeInheritedWidget>();
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
              '${homeInheritedWidget?.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FilledButton(
              onPressed: homeInheritedWidget?.onDecrement,
              child: Text('Decrement'),
            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: homeInheritedWidget?.onIncrement,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
