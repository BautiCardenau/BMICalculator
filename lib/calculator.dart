import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});

  final int weight;
  final int height;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Check your diet and try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Congrats!';
    } else {
      return 'You have a lower than normal body weight. You should eat more.';
    }
  }
}
