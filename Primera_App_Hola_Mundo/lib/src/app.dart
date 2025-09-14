import 'package:flutter/material.dart';
import 'package:practica_1/src/pages/home_page.dart';
import 'package:practica_1/src/pages/increment_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: IncrementPage(),
      ),
    );
  }
}