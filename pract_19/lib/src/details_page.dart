import 'package:flutter/material.dart';
import 'pdf_preview.dart';
import '../ui/details_container.dart';
import '../ui/head_container.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  var datosName;
  var datosGender;
  String? datosImage;

  DetailsPage({this.datosName, this.datosGender, this.datosImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(datosName + ' Details'),
        backgroundColor: Color(0xFFFF422C),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF272A3C),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            MyHeadContainer(imagerec: datosImage),
            MyDetailsContainer(nom: datosName, sexo: datosGender),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF422C),
        child: const Icon(Icons.print_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfPage(
                nombre: datosName,
                genero: datosGender,
                imagenurl: datosImage,
              ),
            ),
          );
        },
      ),
    );
  }
}
