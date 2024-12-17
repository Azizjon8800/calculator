import 'package:calculator_beginner2/providers/calculator_provider.dart';
import 'package:calculator_beginner2/screens.dart/my_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const MyCalculator(),
      ),
    );
  }
}
