import 'package:flutter/material.dart';
import 'package:pract_12/src/view_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 12',
      debugShowCheckedModeBanner: false,
      home: ViewPage(),
    );
  }
}
