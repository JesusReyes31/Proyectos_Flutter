import 'package:flutter/material.dart';
import 'package:pract_11/src/shared_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 11 - Shared Page',
      home: SharedPage(),
    );
  }
}