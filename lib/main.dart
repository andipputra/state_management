import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/data/repositories/province_repository.dart';
import 'package:state_management/features/home/pages/home_page.dart';
import 'package:state_management/features/home/provider/home_controller.dart';
import 'package:state_management/features/province/pages/province_page.dart';
import 'package:state_management/features/province/providers/province_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (context) => ProvinceRepository())],
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
          '/': (context) => ChangeNotifierProvider(
            create: (context) => HomeController(),
            child: const MyHomePage(),
          ),
          '/province': (context) => ChangeNotifierProvider(
            create: (context) =>
                ProvinceController(context.read<ProvinceRepository>()),
            child: const ProvincePage(),
          ),
        },
        initialRoute: '/',
      ),
    );
  }
}
