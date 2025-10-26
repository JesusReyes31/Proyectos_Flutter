import 'package:flutter/material.dart';

class TweenPage extends StatefulWidget {
  const TweenPage({super.key});

  @override
  State<TweenPage> createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> {
  final Tween<double> _escalaTween = Tween<double>(begin: 0, end: 1);
  double _font = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD1C4E9), Color(0xFFB39DDB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: TweenAnimationBuilder(
            tween: _escalaTween,
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 1800),
            builder: (BuildContext context, double escala, Widget? child) {
              return Transform.scale(scale: escala, child: child);
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  'HOLA',
                  style: TextStyle(
                    fontSize: _font,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
