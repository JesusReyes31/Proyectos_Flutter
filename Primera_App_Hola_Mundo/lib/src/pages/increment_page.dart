import 'package:flutter/material.dart';

class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  int _conteo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi primera App en Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Número de Click',style:TextStyle(fontSize: 25)),
            Text('$_conteo',style: TextStyle(fontSize: 30,color: Colors.red),)
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'Decrement',
              onPressed: (){
                setState(() {
                  _conteo--;
                });
              },
              child: Icon(Icons.remove)
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: 'Increment',
            onPressed: (){
              setState(() {
                _conteo++;
              });
            },
            child: Icon(Icons.add)
          ),
          SizedBox(width: 10,),
        ],

      ),
    );
  }
}