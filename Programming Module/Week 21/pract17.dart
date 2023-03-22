void main() {
  print(personalGreeting("Hugh"));
  print(formalName("Hugh", "Baldwin"));
  print(gradeTest(7));
  print(nameToNumber("Hugh"));
}

String personalGreeting(String name) {
  return "Hi ${name} 👋";
}

String formalName(String forename, String surname) {
  return "${forename[0]}. ${surname}";
}

String gradeTest(int mark) {
  return "FFFFCCBBAAA"[mark];
}

int nameToNumber(String name) {
  int total = 0;
  name = name.toLowerCase();

  for (int i = 0; i < name.length; i++) {
    total += name.codeUnitAt(i) - 96;
  }

  return total;
}