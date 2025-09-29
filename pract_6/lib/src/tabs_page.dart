import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Tabs Page'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.accessibility_new)),
              Tab(icon: Icon(Icons.mail_outline)),
              Tab(icon: Icon(Icons.map_outlined)),
              Tab(icon: Icon(Icons.access_alarm)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.accessibility_new,
                    size: 100,
                    color: Colors.blue[400],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Accesibilidad',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail_outline, size: 100, color: Colors.green[400]),
                  const SizedBox(height: 16),
                  const Text(
                    'Correo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 100,
                    color: Colors.orange[400],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Mapas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_alarm,
                    size: 100,
                    color: Colors.purple[400],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Alarma',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
