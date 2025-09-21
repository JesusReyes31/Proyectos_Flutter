
import 'package:flutter/material.dart';
import 'package:pract_5/src/slider_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SliderPage(),
    );
  }
}