import 'dart:math';

void main() {
  print(roundToPlaces(gradient(1, 2, 4, 6), 2));
  print(distanceBetweenTwoPoints(1, 2, 4, 6));
}

double roundToPlaces(double value, int places) {
  value = value * pow(10, places);
  value = value.roundToDouble();
  return value / pow(10, places);
}

double circumferenceOfCircle(double radius) {
  return 2 * pi * radius;
}

double areaOfCircle(double radius) {
  return pi * pow(radius, 2);
}

double gradient(int x1, int y1, int x2, int y2) {
  return (y2 - y1) / (x2 - x1);
}

double distanceBetweenTwoPoints(int x1, int y1, int x2, int y2) {
  return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
}