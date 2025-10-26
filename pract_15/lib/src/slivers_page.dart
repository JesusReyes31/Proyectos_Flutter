import 'dart:math' show Random;
import 'package:flutter/material.dart';

class SliversPage extends StatelessWidget {
  SliversPage({super.key});

  final rnd = Random();
  final List<Color> colors = [ 
    Colors.black, 
    Colors.white, 
    Colors.amber, 
    Colors.brown, 
    Colors.cyan, 
    Colors.green, 
    Colors.grey, 
    Colors.orange, 
    Colors.pink, 
    Colors.purple, 
    Colors.lime, 
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      70,
      (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        height: 100,
        color: colors[rnd.nextInt(colors.length)],
        width: double.infinity,
        child: Center(
          child: Text(
            'Elemento ${index + 1}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(blurRadius: 4, color: Colors.black45, offset: Offset(1, 1))
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              'Práctica 15 - Slivers',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            centerTitle: true,
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: Image.network(
              'https://wallpaperaccess.com/full/496878.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(items),
          ),
        ],
      ),
    );
  }
}
