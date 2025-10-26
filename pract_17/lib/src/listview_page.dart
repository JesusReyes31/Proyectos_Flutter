import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pract_17/data/movies.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('Práctica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          final peli = pelis[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 2,
            child: Slidable(
              key: ValueKey(peli['title_name']),
              startActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) => onDismissed(index, 'Agregar'),
                    backgroundColor: Colors.green,
                    icon: Icons.library_add,
                    label: 'Agregar',
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) => onDismissed(index, 'Eliminar'),
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Eliminar',
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Text(
                    peli['title_name'][0].toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  peli['title_name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  peli['Genres'],
                  style: TextStyle(color: Colors.grey[700]),
                ),
                trailing: const Icon(Icons.movie, color: Colors.orangeAccent),
              ),
            ),
          );
        },
      ),
    );
  }

  onDismissed(int index, String accion) {
    setState(() {
      final _snackBar = SnackBar(content: Text('Accion: $accion'));
      pelis.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    });
  }
}
