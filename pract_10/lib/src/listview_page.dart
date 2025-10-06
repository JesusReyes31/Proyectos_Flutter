import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);

  final List<String> _clasesPokemon = [
    'Normal',
    'Fighting',
    'Flying',
    'Poison',
    'Ground',
    'Rock',
    'Bug',
    'Ghost',
    'Steel',
    'Fire',
    'Water',
    'Grass',
    'Electric',
    'Psychic',
    'Ice',
    'Dragon',
    'Dark',
    'Fairy',
    'Unknown',
    'Shadow',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 10 - Pokédex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      // body: ListView(
      //   children: [
      //     for (String tipo in _clasesPokemon)
      //       ListTile(
      //         contentPadding: EdgeInsets.only(
      //           top: 5,
      //           left: 10,
      //           right: 10,
      //           bottom: 0.0,
      //         ),
      //         title: Text(tipo),
      //         leading: CircleAvatar(
      //           radius: 22.0,
      //           backgroundImage: AssetImage('assets/pokebola.png'),
      //         ),
      //         trailing: Icon(Icons.arrow_right),
      //         onTap: () {},
      //       ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: _clasesPokemon.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Text(_clasesPokemon[index]),
            leading: CircleAvatar(
              radius: 16.0,
              backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/188/188918.png',
              ),
            ),
            trailing: Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}
