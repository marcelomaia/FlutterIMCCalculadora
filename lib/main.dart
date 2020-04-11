import 'helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
//    theme: ThemeData(colorScheme: Colors.red),
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      home: CalculadoraIMC()));
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  String _info_text = 'Informe seus dados.';
  TextEditingController pesoControler = TextEditingController();
  TextEditingController alturaControler = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _reset() {
    setState(() {
      pesoControler.clear();
      alturaControler.clear();
      _info_text = 'Informe seus dados.';
    });
  }

  void _onCalcularPressed() {
    var peso = double.parse(pesoControler.text);
    var altura = double.parse(alturaControler.text);
    setState(() {
      _info_text = calculaIMC(peso, altura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora IMC'),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: _reset)
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 120,
                    color: Colors.green,
                  ),
                  TextFormField(
                    controller: pesoControler,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Peso (KG)',
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira seu peso';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: alturaControler,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Altura (CM)',
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira sua altura';
                      }
                      return null;
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _onCalcularPressed();
                            }
                          },
                          child: Text(
                            'Calcular',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )),
                  Text(
                    _info_text,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  )
                ],
              ),
            )));
  }
}
