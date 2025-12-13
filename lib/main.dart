import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_management/core/bloc_observer.dart';
import 'package:state_management/data/repositories/province_repository.dart';
import 'package:state_management/features/home/bloc/home_bloc.dart';
import 'package:state_management/features/home/cubit/home_new_cubit.dart';
import 'package:state_management/features/home/pages/home_page.dart';
import 'package:state_management/features/new_province/new_province_bloc/new_province_bloc.dart';
import 'package:state_management/features/new_province/pages/new_province_page.dart';
import 'package:state_management/features/province/province_bloc/province_bloc.dart';
import 'package:state_management/features/province/pages/province_page.dart';

void main() {
  Bloc.observer = StateObserve();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider(
          create: (context) =>
              Dio(BaseOptions(baseUrl: 'https://open-api.my.id/api/wilayah')),
        ),
        RepositoryProvider(
          create: (context) => ProvinceRepository(context.read<Dio>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // home: const MyHomePage(),
        routes: {
          '/': (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeNewCubit()),
              BlocProvider(create: (context) => HomeBloc()),
            ],
            child: const MyHomePage(),
          ),
          '/province': (context) => BlocProvider(
            create: (context) => ProvinceBloc(
              provinceRepository: context.read<ProvinceRepository>(),
            ),
            child: const ProvincePage(),
          ),
          '/new_province': (context) => BlocProvider(
            create: (context) => NewProvinceBloc(
              provinceRepository: context.read<ProvinceRepository>(),
            )..add(NewProvinceFetch()),
            child: const NewProvincePage(),
          ),
        },
        initialRoute: '/',
      ),
    );
  }
}
