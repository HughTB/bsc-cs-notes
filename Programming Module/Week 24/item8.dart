import 'dart:math';

void main() {
  GradeManager manager = GradeManager(40);
  // WRITE CODE HERE

  // 2.2
  manager.addGrade(39);
  manager.addGrade(78);
  manager.addGrade(55);

  // 2.3
  print(manager.toString());

  // 3.1
  manager.compensate();
  print(manager.toString());

  // 3.2
  print('Average grade: ${roundToDp(manager.getAverage(), 2)}');
}

double roundToDp(double value, int places) {
  value *= pow(10, places);
  value = value.roundToDouble();
  value /= pow(10, places);

  return value;
}

class GradeManager {
  List<int> grades = [];
  // WRITE CODE HERE

  int passingGrade = 0;

  GradeManager(this.passingGrade);

  void addGrade(int grade) {
    grades.add(grade);
  }

  void compensate() {
    for (int i = 0; i < grades.length; i++) {
      if (grades[i] < passingGrade)
        grades[i] = passingGrade;
    }
  }

  double getAverage() {
    int sum = 0;

    for (int grade in grades) {
      sum += grade;
    }

    double average = sum / grades.length; // Calculate average

    return average;
  }

  @override
  String toString() {
    String str = '';

    for (int i = 0; i < grades.length; i++) {
      str += '($i) ${grades[i]}\n';
    }

    return str;
  }
}