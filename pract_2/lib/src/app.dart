import 'package:flutter/material.dart';
import 'package:pract_2/src/page1.dart';
import 'package:pract_2/src/page2.dart';
import 'package:pract_2/src/page3.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 02',
      initialRoute: '/Page1',
      routes: {
        '/Page1': (context) => const Page1(),
        '/Page2': (context) => const Page2(),
        '/Page3': (context) => const Page3(),
      },
    );
  }
}