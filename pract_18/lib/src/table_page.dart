import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Práctica 18 - Orientación',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
              },
              children: const [
                TableRow(
                  children: [
                    RectangleLarge(),
                    RectangleMedium(),
                    RectangleSmall(),
                  ],
                ),
                TableRow(
                  children: [
                    RectangleSmall(),
                    RectangleLarge(),
                    RectangleMedium(),
                  ],
                ),
                TableRow(
                  children: [
                    RectangleMedium(),
                    RectangleSmall(),
                    RectangleLarge(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RectangleLarge extends StatelessWidget {
  const RectangleLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2))
        ],
      ),
    );
  }
}

class RectangleMedium extends StatelessWidget {
  const RectangleMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.greenAccent.shade400,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2))
        ],
      ),
    );
  }
}

class RectangleSmall extends StatelessWidget {
  const RectangleSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.amberAccent.shade700,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2))
        ],
      ),
    );
  }
}
