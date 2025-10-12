import 'dart:convert';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 12 - Pokédex', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.indigo.shade50, Colors.white])),
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/pokedex.json'),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator(color: Colors.indigo));
            
            var pokemon = jsonDecode(snapshot.data!);
            return GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width / 140).floor().clamp(2,5),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.85,
              ),
              itemCount: pokemon.length,
              itemBuilder: (context, index) {
                var p = pokemon[index];
                var types = p['type'].toString().replaceAll('[', '').replaceAll(']', '').split(', ');
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.white, Colors.grey.shade50]),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 4))],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.indigo.shade400, Colors.indigo.shade600]),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(child: Text('#${index + 1}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
                      ),
                      SizedBox(height: 8),
                      Text(p['name']['english'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.indigo.shade800)),
                      SizedBox(height: 4),
                      Wrap(
                        spacing: 4,
                        children: types.map((type) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getTypeColor(type.trim()),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(type.trim(), style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        )).toList(),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire': return Colors.orange;
      case 'water': return Colors.blue;
      case 'grass': return Colors.green;
      case 'electric': return Colors.yellow.shade700;
      case 'psychic': return Colors.purple;
      case 'ice': return Colors.cyan;
      case 'dragon': return Colors.indigo;
      case 'dark': return Colors.brown;
      case 'fairy': return Colors.pink;
      case 'fighting': return Colors.red;
      case 'flying': return Colors.blue.shade300;
      case 'poison': return Colors.purple.shade700;
      case 'ground': return Colors.amber.shade800;
      case 'rock': return Colors.grey.shade600;
      case 'bug': return Colors.green.shade600;
      case 'ghost': return Colors.purple.shade400;
      case 'steel': return Colors.grey.shade500;
      default: return Colors.grey;
    }
  }
}