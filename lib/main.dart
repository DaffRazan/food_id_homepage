import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_id_homepage/bloc/food_bloc.dart';
import 'package:food_id_homepage/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FoodBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food ID Homepage',
        home: HomeScreen(),
      ),
    );
  }
}
