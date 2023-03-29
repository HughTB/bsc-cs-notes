import 'dart:math';

void main() {
  int width = 25;
  int height = 5;

  int perimeter = getPerimeter(width, height);
  int area = getArea(width, height);

  print("For a rectangle of width $width and height $height,");
  print("The perimeter is $perimeter and the area is $area");

  print("\nHeight  Width  Diagonal");
  print("-----------------------");

  for (double i = 10; i <= 100; i += 10) {
    print("${padWithSpaces(5.0, 7)} ${padWithSpaces(i, 6)} ${roundToPlaces(getDiagonal(i, 5.0), 2)}");
  }
}

int getPerimeter(int width, int height) {
  return (width + height) * 2;
}

int getArea(int width, int height) {
  return width * height;
}

double getDiagonal(double width, double height) {
  return sqrt(pow(width, 2) + pow(height, 2));
}

double roundToPlaces(double value, int places) {
  value = value * pow(10, places);
  value = value.roundToDouble();
  value = value / pow(10, places);

  return value;
}

String padWithSpaces(double value, int chars) {
  String valueString = value.toString();
  return valueString + " " * (chars - valueString.length);
}