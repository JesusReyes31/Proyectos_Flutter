import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPage extends StatefulWidget {
  SharedPage({Key? key}) : super(key: key);

  @override
  _SharedPageState createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  int _edad = 0;
  String _nombre = '';

  _grabarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nombre', 'Jesus Reyes');
    prefs.setInt('edad', 22);
  }

  _leerDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nombre = prefs.getString('nombre')!;
    _edad = prefs.getInt('edad')!;
  }

  @override
  void initState() {
    _grabarDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 11 - Shared Page'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $_nombre'),
            SizedBox(height: 15),
            Text('Edad: $_edad'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _leerDatos();
          });
        },
        tooltip: 'Refrescar',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
