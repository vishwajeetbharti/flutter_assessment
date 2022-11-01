import 'package:flutter/material.dart';
import 'package:flutter_assessment/bloc/splash_bloc/splash_bloc.dart';
import 'package:flutter_assessment/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Loginapi _loginapi = Loginapi();
  @override
  void initState() {
    super.initState();
    _loginapi.add(CheckSession());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (_) => _loginapi,
          child: BlocBuilder<Loginapi, InitialState>(builder: (context, state) {
            if (state is HomeScreen) {
              return const Home();
            } else {
              return const InitialScreen();
            }
          }),
        ),
      ),
    );
  }
}
