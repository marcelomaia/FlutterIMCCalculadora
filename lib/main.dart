import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
//    theme: ThemeData(colorScheme: Colors.red),
      home: CalculadoraIMC()));
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {})
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.person_outline,
            size: 120,
            color: Colors.green,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'PesoKG',
              labelStyle: TextStyle(color: Colors.green),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Altura',
              labelStyle: TextStyle(color: Colors.green),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
          ),
          Container(
            height: 50,
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {},
              child: Text(
                'Calcular',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Text(
            'Info',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
          )
        ],
      ),
    );
  }
}
