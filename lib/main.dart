import 'package:cep_finder/bloc/navigation/navigation_cubit.dart';
import 'package:cep_finder/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CEP FINDER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<NavigationCubit>(
        create: (context) => NavigationCubit(),
        child: const MainPage(),
      ),
    );
  }
}
