void main() {
  print("The sum of multiples of 3 or 5 up to 1000 is ${multiplesOf3Or5(1000)}");
  print("The sum of even fibonacci terms less than 4 million is ${evenFibNumbers(4000000)}");
}

int multiplesOf3Or5(int max) {
  int total = 0;

  for (int i = 0; i < max; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      total += i;
    }
  }

  return total;
}

int evenFibNumbers(int max) {
  int prev = 1;
  int current = 1;

  int total = 0;

  while (current < max) {
    int temp = current;

    current = prev + current;
    prev = temp;

    if (current % 2 == 0) {
      total += current;
    }
  }

  return total;
}