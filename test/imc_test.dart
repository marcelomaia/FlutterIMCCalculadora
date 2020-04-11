// Import the test package and Counter class

import 'package:calculadoraimc/helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testa IMC', () {
    expect(calculaIMC(75, 170), 'Seu imc é de 25.95: Sobrepeso');
    expect(calculaIMC(75, 200), 'Seu imc é de 18.75: Peso normal');
    expect(calculaIMC(65, 170), 'Seu imc é de 22.49: Peso normal');
    expect(calculaIMC(50, 170), 'Seu imc é de 17.30: Abaixo do peso');
    expect(calculaIMC(70, 180), 'Seu imc é de 21.60: Peso normal');
  });
}
