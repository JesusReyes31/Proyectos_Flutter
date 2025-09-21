import 'package:flutter/material.dart';
import 'package:pract_4/src/home_page.dart';

class DatosPage extends StatelessWidget {
  final Data data;
  DatosPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Recibidos'), 
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Los datos son:'),
            Text('Nombre: ${data.nombre}'),
            Text('Sexo: ${data.sexo}'),
          ],
        ),
      ),
    );
  }
}
