import 'package:flutter/material.dart';
import 'package:pract_17/src/listview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 17',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const ListViewPage(),
    );
  }
}