import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/features/home/bloc/home_bloc.dart';
import 'package:state_management/features/home/cubit/home_new_cubit.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<HomeBloc>().add(HomeIncrementEvent());
        context.read<HomeNewCubit>().increment();
      },
      child: Text('Increment'),
    );
  }
}
