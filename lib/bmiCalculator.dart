import 'dart:math';

class BMICalculator {
  double height;
  int weight;
  double _bmi;

  BMICalculator({this.height, this.weight});
  String getBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi == null) {
      getBMI();
    }
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
     if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job.';
    } else {
      return 'You have a lower than normal body weight. Try to exercise more.';
    }
  }
}
