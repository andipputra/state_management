import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/features/home/bloc/home_bloc.dart';
import 'package:state_management/features/home/cubit/home_new_cubit.dart';
import 'package:state_management/features/home/widget/decrement_button.dart';
import 'package:state_management/features/home/widget/increment_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNewCubit = context.watch<HomeNewCubit>();

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
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state.counter % 2 == 0) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Counter is even')));
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Counter is odd')));
                }
              },
              builder: (context, state) {
                return Text(
                  'Home BLoC: ${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Text(
              'Home new Cubit: ${homeNewCubit.state}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            DecrementButton(),
            IncrementButton(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/province');
              },
              child: Text('Go To Province'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/new_province');
              },
              child: Text('Go To New Province'),
            ),
          ],
        ),
      ),
    );
  }
}
