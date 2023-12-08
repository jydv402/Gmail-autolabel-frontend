import 'package:flutter/material.dart';
import 'package:hackathon/home.dart';
import 'package:hackathon/details.dart';
import 'package:hackathon/result.dart';
import 'package:hackathon/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double ipBorder = 16;
    return MaterialApp(
      routes: {
        '/': (context) => const MyHomePage(),
        '/details': (context) => const DetailsPage(),
        '/slider': (context) => const SliderPage(),
        '/load': (context) => const LoadingPage(),
        '/result': (context) => const ResultPage(),
        '/label': (context) => const Labels(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(ipBorder)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(ipBorder)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(ipBorder)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(ipBorder))),
        textTheme: const TextTheme(
            bodySmall: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18,
                fontFamily: 'Product'),
            bodyMedium: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Product'),
            bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
                fontFamily: 'Product')),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(background: Colors.black),
      ),
    );
  }
}
