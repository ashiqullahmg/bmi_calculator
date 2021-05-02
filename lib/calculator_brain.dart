import 'dart:math';
import 'package:bmi_calculator/constants.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  final int age;
  final String gender;
  String _result = 'NORMAL';
  double lower;
  double upper;
  CalculatorBrain({this.height, this.weight, this.age, this.gender});

  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    try {
      //TODO: ask if the person is male or female and check if under 21
      if (age < 21 && gender == 'male') {
        lower = bmiBoy[age - 2][0];
        upper = bmiBoy[age - 2][1];

        if (_bmi > upper) {
          _result = 'OVERWEIGHT';
        } else if (_bmi >= lower) {
          _result = 'NORMAL';
        } else {
          _result = 'UNDERWEIGHT';
        }

        print('boy');
      } else if (age < 21 && gender == 'female') {
        lower = bmiGirl[age - 2][0];
        upper = bmiGirl[age - 2][1];

        if (_bmi > upper) {
          _result = 'OVERWEIGHT';
        } else if (_bmi >= lower) {
          _result = 'NORMAL';
        } else {
          _result = 'UNDERWEIGHT';
        }

        print('girl- $upper');
      } else {
        if (_bmi >= 25) {
          _result = 'OVERWEIGHT';
        } else if (_bmi > 18.5) {
          _result = 'NORMAL';
        } else {
          _result = 'UNDERWEIGHT';
        }
        print('adult');
      }
    } catch (e) {
      print(e);
    }
    return _result;
  }

  String getInterpretation() {
    if (_result == 'OVERWEIGHT') {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_result == 'NORMAL') {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
