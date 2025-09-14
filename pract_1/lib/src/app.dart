import 'package:flutter/material.dart';
import 'package:pract_1/src/userData.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 01',
      home: Center(child: DatosUsuarios())
    );
  }
}