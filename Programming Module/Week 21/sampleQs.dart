import 'dart:math';

void main() {
  double radius = 5;
  double circumference = getCircumference(radius);
  double area = getArea(radius);

  print("Radius: ${radius}");
  print("Circumference: ${circumference}");
  print("Area: ${area}");
  print("Rounded circumference: ${roundTwoDp(circumference)}");
  print("Rounded area: ${roundTwoDp(area)}");
}

double numToDouble(num number) {
  return number.toDouble();
}

String intToString(int number) {
  return number.toString();
}

String doubleToString(double number) {
  return number.toString();
}

double roundTwoDp(double number) {
  double remainder = number % 0.01;
  double truncated = (number * 100).truncateToDouble();

  if (remainder > 0.004) {
    truncated += 1;
  }

  return truncated / 100;
}

double getCircumference(double radius) {
  return pi * 2 * radius;
}

double squared(double value) {
  return pow(value, 2).toDouble();
}

double getArea(double radius) {
  return pi * squared(radius);
}