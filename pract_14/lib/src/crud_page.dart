import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  late Database? database;
  late String _path;
  bool ready = false;
  List<Map> records = [];

  @override
  void initState() {
    super.initState();
    _createDB();
  }

  @override
  void dispose() {
    database?.close();
    super.dispose();
  }

  void _createDB() async {
    try {
      var dbpath = await getDatabasesPath();
      _path = '${dbpath}/my_db.db';
      database = await openDatabase(
        _path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, nickname TEXT)',
          );
        });
      setState(() => ready = true);
      _refresh();
    } catch (e) {
      print('Error: $e');
    }
  }

  void _refresh() async {
    if (database != null) {
      records = await database!.rawQuery('SELECT * FROM Test');
      setState(() {});
    }
  }

  void _showDB() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Tabla Completa'),
        content: Container(
          width: double.maxFinite,
          child: records.isEmpty
              ? Text('Sin registros')
              : DataTable(
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Apodo')),
                  ],
                  rows: records
                      .map(
                        (r) => DataRow(
                          cells: [
                            DataCell(Text(r['id'].toString())),
                            DataCell(Text(r['name'])),
                            DataCell(Text(r['nickname'])),
                          ],
                        ),
                      )
                      .toList(),
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _insertDB() async {
    if (!ready) return;
    try {
      await database!.transaction((txn) async {
        int reg1 = await txn.rawInsert(
          'INSERT INTO Test (name, nickname) VALUES ("Din Djarin","Mandalorian")',
        );
        print('INSERT {$reg1}');
        int reg2 = await txn.rawInsert(
          'INSERT INTO Test (name, nickname) VALUES (?,?)',
          ['Grogu', 'Baby Yoda'],
        );
        _refresh();
        print('INSERT {$reg2}');
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void _removeDB() async {
    if (!ready) return;
    try {
      int rem = await database!.rawDelete('DELETE FROM Test WHERE name = ?', ['Grogu']);
      _refresh();
      print('DELETE {$rem}');
    } catch (e) {
      print('Error: $e');
    }
  }

  void _updateDB() async {
    if (!ready) return;
    try {
      int upt = await database!.rawUpdate('UPDATE Test SET nickname = ? WHERE name = ?', ['Mando', 'Din Djarin']);
      _refresh();
      print('UPDATE {$upt}');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 14 - SQLite'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ready ? Colors.green.shade100 : Colors.red.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ready ? Colors.green : Colors.red),
              ),
              child: Row(
                children: [
                  Icon(
                    ready ? Icons.check_circle : Icons.error,
                    color: ready ? Colors.green : Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text(
                    ready ? 'BD Conectada' : 'Conectando...',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Registros en BD:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  if (records.isEmpty)
                    Text('Sin registros', style: TextStyle(color: Colors.grey))
                  else
                    ...records.map(
                      (r) => Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.indigo.shade100,
                              child: Text(
                                r['id'].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  r['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  r['nickname'],
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton.icon(
                  onPressed: (){
                    _insertDB();
                  },
                  icon: Icon(Icons.add),
                  label: Text('INSERT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: (){
                    _removeDB();
                  },
                  icon: Icon(Icons.delete),
                  label: Text('DELETE'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: (){
                    _updateDB();
                  },
                  icon: Icon(Icons.edit),
                  label: Text('UPDATE'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: (){
                    _showDB();
                  },
                  icon: Icon(Icons.table_chart),
                  label: Text('SHOW'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}