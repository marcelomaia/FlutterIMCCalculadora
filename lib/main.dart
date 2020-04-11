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
  String _info_text = 'Informe seus dados.';
  TextEditingController pesoControler = TextEditingController();
  TextEditingController alturaControler = TextEditingController();

  void _reset() {
    setState(() {
      pesoControler.clear();
      alturaControler.clear();
      _info_text = 'Informe seus dados.';
    });
  }

  void calculaIMC() {
    double peso = double.parse(pesoControler.text);
    double altura = double.parse(alturaControler.text) / 100;
    double imc = peso / (altura * altura);
    print(imc);
    if (imc < 18.6) {
      _info_text =
          'Seu imc é de ${imc.toStringAsPrecision(4)} -> Abaixo do peso';
    } else if (18.6 <= imc && imc <= 24.9) {
      _info_text = 'Seu imc é de ${imc.toStringAsPrecision(4)} -> Peso normal';
    } else if (24.9 <= imc && imc <= 29.9) {
      _info_text = 'Seu imc é de ${imc.toStringAsPrecision(4)} -> Sobrepeso';
    } else if (29.9 <= imc && imc <= 34.9) {
      _info_text =
          'Seu imc é de ${imc.toStringAsPrecision(4)} -> Obesidade Grau I';
    } else if (34.9 <= imc && imc <= 39.9) {
      _info_text =
          'Seu imc é de ${imc.toStringAsPrecision(4)} -> Obesidade Grau II';
    } else if (40 <= imc) {
      _info_text =
          'Seu imc é de ${imc.toStringAsPrecision(4)} -> Obesidade Grau III';
    }
    setState(() {
      _info_text = _info_text;
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
            IconButton(icon: Icon(Icons.refresh), onPressed: this._reset)
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextField(
                controller: pesoControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (KG)',
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
              ),
              TextField(
                controller: alturaControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (CM)',
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: calculaIMC,
                      child: Text(
                        'Calcular',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )),
              Text(
                this._info_text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
              )
            ],
          ),
        ));
  }
}
