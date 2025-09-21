import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/home_page.dart';

class Clasification extends StatelessWidget {
  final DataIMC data;
  const Clasification({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clasificación IMC'),
        backgroundColor: Colors.orange[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Su Peso es: ${data.peso} kg",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Su Altura es: ${data.altura} m",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "Su IMC es:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                "${data.imc}",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[700],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Clasificación:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                "${data.clasificacion}",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              if (data.imagen.isNotEmpty) ...[
                SizedBox(height: 30),
                Image.asset(data.imagen, width: 250, height: 250),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
