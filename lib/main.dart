import 'package:flutter/material.dart';
import 'package:hackathon/home.dart';
import 'package:hackathon/details.dart';

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
        '/details': (context) => const DetailsPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
            bodyMedium: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold)),
      ),
      home: const MyHomePage(),
    );
  }
}
