import 'package:flutter/material.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({super.key});

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 07 - Bottom Navigation'), 
        centerTitle: true,
        backgroundColor: Colors.green[300]
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[300],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'E-mail'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarma'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  final tabs = [
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map, size: 60, color: Colors.blue),
          SizedBox(height: 16),
          Text('Mapa', style: TextStyle(fontSize: 24, color: Colors.blue)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mail, size: 60, color: Colors.orange),
          SizedBox(height: 16),
          Text('E-mail', style: TextStyle(fontSize: 24, color: Colors.orange)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.alarm, size: 60, color: Colors.green),
          SizedBox(height: 16),
          Text('Alarma', style: TextStyle(fontSize: 24, color: Colors.green)),
        ],
      ),
    ),
  ];
}
