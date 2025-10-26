import 'package:flutter/material.dart';
import 'package:pract_16/src/animated_page.dart';
import 'package:pract_16/src/tween_page.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Práctica 16 - Animaciones',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildOptionTile(
              context,
              title: 'Animated',
              icon: Icons.animation,
              color: Colors.indigoAccent,
              page: const AnimatedPage(),
            ),
            _buildOptionTile(
              context,
              title: 'Tween',
              icon: Icons.motion_photos_on,
              color: Colors.deepPurpleAccent,
              page: const TweenPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget page}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}
