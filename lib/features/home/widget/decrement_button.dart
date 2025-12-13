import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/features/home/bloc/home_bloc.dart';
import 'package:state_management/features/home/cubit/home_new_cubit.dart';

class DecrementButton extends StatelessWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        context.read<HomeBloc>().add(HomeDecrementEvent());
        context.read<HomeNewCubit>().decrement();
      },
      child: Text('Decrement'),
    );
  }
}
