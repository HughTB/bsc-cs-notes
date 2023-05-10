void main() {
  print("Q1");
  q1();
  print("Q2");
  q2();
  print("Q3");
  q3();
  print("Q4");
  q4();
  print("Q5");
  q5();
  print("Q6");
  q6();
  print("Q7");
  q7();
}

void q1() {
  List<String> customers = ['Ştefan', 'Amy', 'Jamilla', 'Xiu', 'Amy'];
  listInfo(customers); // Size=5, first=Ştefan, last=Amy
  
  customers.add('Nadim');
  listInfo(customers); // Size=6, first=Ştefan, last=Nadim
}

void listInfo(List<String> list) {
  print("Size=${list.length}, first=${list[0]}, last=${list.last}");
}

void q2() {
  List<int> myMarks = [47, 65, 34, 73, 0];
  capMarks(myMarks);
  print(myMarks); // Should print: [40, 40, 34, 40, 0]
}

void capMarks(List<int> marks) {
  for (int i = 0; i < marks.length; i++) {
    marks[i] = (marks[i] > 40) ? 40 : marks[i];
  }
}

void q3() {
  Map<String, String> orders = {
    // Key (name): Value (drink)
    'Ştefan': 'Espresso Frappuccino',
    'Amy T': 'Iced Coffee',
    'Jamillah': 'Caramel Frappuccino',
    'Xiu': 'Caffè Latte',
    'Amy E': 'Caramel Frappuccino'
  };

  printOrders(orders);
}

void printOrders(Map<String, String> orders) {
  for (String customer in orders.keys) {
    print("${customer} has ordered: ${orders[customer]}");
  }
}

void q4() {
  double average = mean([47, 65, 34, 73, 0]);

  print("${average}");
}

double mean(List<int> values) {
  double sum = 0;
  
  for (int i = 0; i < values.length; i++) {
    sum += values[i];
  }

  return sum / values.length;
}

void q5() {
  Map<String, int> credits = {
    "Programming" : 40,
    "Architecture and Operating Systems" : 20,
    "Database Systems Development" : 20,
    "Core Computing Concepts" : 20,
    "Networks" : 20
  };

  for (String module in credits.keys) {
    print("${module} has ${credits[module]} credits");
  }
}

void q6() {
  Map<String, List<int>> marksMap = {
    "Programming" : [100, 100, 80, 73, 80],
    "Architecture and Operating Systems" : [70, 80, 92, 64]
  };

  for (String module in marksMap.keys) {
    String marks = "";

    for (int mark in marksMap[module]!) {
      marks += "${mark}, ";
    }

    print("In ${module} I got: ${marks}");
  }
}

void q7() {
  Map<String, int> credits = {
    "Programming" : 40,
    "Architecture and Operating Systems" : 20,
    "Database Systems Development" : 20,
    "Core Computing Concepts" : 20,
    "Networks" : 20
  };

  Map<String, List<int>> marksMap = {
    "Programming" : [100, 100, 80, 73, 80],
    "Architecture and Operating Systems" : [70, 80, 92, 64],
    "Database Systems Development" : [90, 80, 92, 30],
    "Core Computing Concepts" : [74, 60],
    "Networks" : [90, 70, 67]
  };

  String grade = gradeCalculator(credits, marksMap);
  print("$grade");
}

String gradeCalculator(Map<String, int> credits, Map<String, List<int>> marks) {
  List<double> weights = [];
  List<double> moduleMarks = [];

  for (String module in marks.keys) {
    weights.add(credits[module]! / 120);
    moduleMarks.add(average(marks[module]!));
  }

  double grade = 0;

  for (int i = 0; i < moduleMarks.length; i++) {
    grade += moduleMarks[i] * weights[i];
  }

  if (grade > 70) {
    return "1st";
  } else if (grade > 60) {
    return "2:1";
  } else if (grade > 50) {
    return "2:2";
  } else {
    return "Fail";
  }
}

double average(List<int> values) {
  double sum = 0;

  for (int i = 0; i < values.length; i++) {
    sum += values[i];
  }

  return sum / values.length;
}