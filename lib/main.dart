import 'package:flutter/material.dart';
import 'package:flutter_application_2/fast_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_bloc_observer.dart';
import 'traning_cubit/cubit/traning_case_cubit.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TraningCaseCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyFilterBar(),
      ),
    );
  }
}
