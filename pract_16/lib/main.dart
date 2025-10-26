import 'package:flutter/material.dart';
import 'package:pract_16/src/listview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Práctica 16 ',
      home: ListViewPage(),
    );
  }
}