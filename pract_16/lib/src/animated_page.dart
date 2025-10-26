import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _height = 150;
  double _width = 150;
  double _font = 25;
  bool _expanded = false;

  void _updateState() {
    setState(() {
      _expanded = !_expanded;
      _height = _expanded ? 300 : 150;
      _width = _expanded ? 300 : 150;
      _font = _expanded ? 50 : 25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC5CAE9), Color(0xFF9FA8DA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            curve: Curves.bounceOut,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 8, offset: Offset(3, 3))
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
      floatingActionButton: FloatingActionButton(
        onPressed: _updateState,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.play_arrow, color: Colors.white),
      ),
    );
  }
}
