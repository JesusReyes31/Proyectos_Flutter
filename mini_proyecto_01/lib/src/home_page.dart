import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/clasification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final peso = new TextEditingController();
  final altura = new TextEditingController();
  final data = DataIMC(peso: 0.0, altura: 0.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora IMC',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blue[400],
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: peso,
              decoration: InputDecoration(
                labelText: 'Ingrese el peso en kg',
                labelStyle: TextStyle(color: Colors.grey[700]),
              ),
              keyboardType: TextInputType.number,
              
            ),
            TextField(
              controller: altura,
              decoration: InputDecoration(
                labelText: 'Ingrese la altura en metros',
                labelStyle: TextStyle(color: Colors.grey[700]),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  data.peso = double.parse(peso.text);
                  data.altura = double.parse(altura.text);
                  data.imc = data.peso / (data.altura * data.altura);
                  if(data.imc < 18){
                    data.clasificacion = 'Peso Bajo. Necesario valorar signos de desnutrición';
                    data.imagen = 'assets/peso_bajo.png';
                  } else if(data.imc >= 18 && data.imc < 25){
                    data.clasificacion = 'Normal';
                    data.imagen = 'assets/peso_normal.png';
                  } else if(data.imc >= 25 && data.imc < 26.9){
                    data.clasificacion = 'Obesidad';
                    data.imagen = 'assets/obesidad.png';
                  } else if(data.imc >= 27 && data.imc < 29.9){
                    data.clasificacion = 'Obesidad grado I. Riesgo relativo para desarrollar enfermedades cardiovasculares';
                    data.imagen = 'assets/obesidadI.png';
                  } else if(data.imc >= 30 && data.imc < 39.9){
                    data.clasificacion = 'Obesidad grado II. Riesgo relativo muy alto para el desarrollo de enfermedades cardiovasculares';
                    data.imagen = 'assets/obesidadII.png';
                  } else if(data.imc >= 40){
                    data.clasificacion = 'Obesidad grado III. (Extrema, mórbida). Riesgo relativo extremadamente alto para el desarrollo de enfermedades cardiovasculares';
                    data.imagen = 'assets/obesidadIII.png';
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Clasification(data: data),
                    ),
                  );
                });
              },
              child: const Text('Calcular IMC'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataIMC {
  double peso;
  double altura;
  double imc = 0.0;
  String clasificacion = '';
  String imagen = '';
  DataIMC({required this.peso, required this.altura});
}
