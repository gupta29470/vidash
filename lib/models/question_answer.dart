class QuestionAnswer {
  final double number1;
  final double number2;
  final List<double> options;

  QuestionAnswer({
    required this.number1,
    required this.number2,
    required this.options,
  });
}

List<QuestionAnswer> data = [
  QuestionAnswer(
    number1: 6,
    number2: 3,
    options: [9, 3, 18, 2],
  ),
  QuestionAnswer(
    number1: 9,
    number2: 5,
    options: [14, 4, 45, 1.8],
  ),
  QuestionAnswer(
    number1: 6,
    number2: 3,
    options: [9, 3, 18, 2],
  ),
  QuestionAnswer(
    number1: 6,
    number2: 3,
    options: [9, 3, 18, 2],
  ),
  QuestionAnswer(
    number1: 9,
    number2: 5,
    options: [14, 4, 45, 1.8],
  ),
];
