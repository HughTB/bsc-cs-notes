void main() {
  double euros = 30;
  double pounds = eurosToPounds(euros);

  print("€${euros} = £${pounds}");

  double fahrenheit = 75;
  double celsius = fahrenheitToCelsius(fahrenheit);

  print("${fahrenheit}°F = ${celsius}°F");

  double gallons = 10;
  double price = costToFill(gallons);

  print("It costs £${price} to fill a ${gallons}gal tank");
}

double eurosToPounds(double euros) {
  return euros * 0.84;
}

double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

double costToFill(double gal) {
  double litres = gal * 4.546;

  return litres * 1.476;
}