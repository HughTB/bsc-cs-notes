import "dart:math";

void main() {
  Point p1 = Point(-4, 5);
  Point p2 = Point(3, 2);

  print("The distance between $p1 and $p2 is ${distanceBetweenTwoPoints(p1, p2)}");

  Circle circle1 = Circle(10, Point(10, 10));
  Rectangle rectangle1 = Rectangle(10, 20, Point(10, 10));

  print("For $circle1, the area is ${circle1.getArea()} and the circumference is ${circle1.getCircumference()}");
  print("For $rectangle1, the area is ${rectangle1.getArea()} and the perimeter is ${rectangle1.getPerimeter()}");

  print("Scale both by 2");

  circle1.scale(2);
  rectangle1.scale(2);

  print("They are now: $circle1 and $rectangle1");

  Question q1 = Question("Is the pope Catholic?", "Yes");

  print(q1);
  print(q1.guess("No"));
  print(q1.guess("Yes"));

  List<Question> questions = [
    Question("Is the pope Catholic?", "Yes"),
    Question("What is 2 + 2?", "4"),
    Question("What is 9 + 10?", "19")
  ];

  Exam exam1 = Exam(questions);

  print("Exam 1");
  print(exam1);

  List<String> answers = ["Yes", "5", "19"];

  exam1.setAnswers(answers);
  print("Score: ${exam1.score} Passed? ${exam1.passed()}");
}

class Point {
  int x;
  int y;

  Point(this.x, this.y);

  void move(int dX, int dY) {
    x = x + dX;
    y = y + dY;
  }

  int getX() => x;

  int getY() => y;

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }
}

double distanceBetweenTwoPoints(Point p1, Point p2) {
  return sqrt(pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2));
}

class Circle {
  int radius;
  Point centre;

  Circle(this.radius, this.centre);

  Point getCentre() => centre;

  double getArea() => pi * pow(radius, 2);
  double getCircumference() => pi * 2 * radius;

  void scale(int scaleFactor) {
    radius *= scaleFactor;
  }

  @override
  String toString() {
    return 'Circle{radius: $radius, centre: $centre}';
  }
}

class Rectangle {
  int width;
  int height;
  Point centre;

  Rectangle(this.width, this.height, this.centre);

  Point getCentre() => centre;

  double getArea() => width.toDouble() * height.toDouble();
  double getPerimeter() => width * 2 + height * 2;

  void scale(int scaleFactor) {
    width *= scaleFactor;
    height *= scaleFactor;
  }

  @override
  String toString() {
    return 'Rectangle{width: $width, height: $height, centre: $centre}';
  }
}

class Question {
  String query;
  String answer;

  Question(this.query, this.answer);

  bool guess(String guess) => guess == answer;

  @override
  String toString() {
    return query;
  }
}

class Exam {
  List<Question> questions;
  int score = 0;

  Exam(this.questions);

  bool passed() => score > 40;

  void setAnswers(List<String> answers) {
    score = 0;

    for (int i = 0; i < answers.length; i++) {
      score += (questions[i].guess(answers[i])) ? 100 ~/ questions.length : 0;
    }
  }

  @override
  String toString() {
    String queries = "";

    for (Question q in questions) {
      queries += q.query + "\n";
    }

    return queries;
  }
}