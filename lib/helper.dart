String calculaIMC(double pesoKG, double alturaCM) {
  double alturaM = alturaCM / 100;
  print('altura cm: $alturaCM, altura m $alturaM, peso $pesoKG');
  double imc = pesoKG / (alturaM * alturaM);
  String _infoText = '...';
  if (imc < 18.6) {
    _infoText = 'Seu imc é de ${imc.toStringAsPrecision(4)}: Abaixo do peso';
  } else if (18.6 <= imc && imc <= 24.9) {
    _infoText = 'Seu imc é de ${imc.toStringAsPrecision(4)}: Peso normal';
  } else if (24.9 <= imc && imc <= 29.9) {
    _infoText = 'Seu imc é de ${imc.toStringAsPrecision(4)}: Sobrepeso';
  } else if (29.9 <= imc && imc <= 34.9) {
    _infoText =
        'Seu imc é de ${imc.toStringAsPrecision(4)}: Obesidade Grau I';
  } else if (34.9 <= imc && imc <= 39.9) {
    _infoText =
        'Seu imc é de ${imc.toStringAsPrecision(4)}: Obesidade Grau II';
  } else if (40 <= imc) {
    _infoText =
        'Seu imc é de ${imc.toStringAsPrecision(4)}: Obesidade Grau III';
  }
  return _infoText;
}
