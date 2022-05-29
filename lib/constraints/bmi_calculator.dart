import 'dart:math';

class BmiCalc {
  final double weight;
  final double height;

  BmiCalc({required this.height, required this.weight});
  double bmi = 0;

  String calculateBmi() {
    bmi = weight / (pow(height / 100, 2));
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return "Over Weight";
    } else if (bmi <= 18.5) {
      return "Under Weight";
    } else {
      return "Normal Weight";
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (bmi <= 18.5) {
      return "You have a lower than normal body weight. You should eat a bit more.";
    } else {
      return "You have a normal body weight. Good job!";
    }
  }
}
