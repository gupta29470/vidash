import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virash_task/models/question_answer.dart';
import 'package:virash_task/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String operation;

  const QuizScreen({
    required this.operation,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int score = 0;
  double answer = 0;

  void _updatingAnswer(double number1, double number2) {
    if (widget.operation == "+") {
      _addition(number1, number2);
    } else if (widget.operation == "-") {
      _subtraction(number1, number2);
    } else if (widget.operation == "*") {
      _multiplication(number1, number2);
    } else if (widget.operation == "/") {
      _division(number1, number2);
    }
  }

  void _updatingScore(BuildContext context, double answerChosen) {
    if (answerChosen == answer) {
      setState(() {
        questionIndex++;
        score += 5;
      });
    } else {
      _showAlertDialog(context);
    }
  }

  void _addition(double number1, double number2) {
    answer = number1 + number2;
  }

  void _subtraction(double number1, double number2) {
    answer = number1 - number2;
  }

  void _multiplication(double number1, double number2) {
    answer = number1 * number2;
  }

  void _division(double number1, double number2) {
    answer = number1 / number2;
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: Text(
            "Oops!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          content: Text(
            "Wrong Answer",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  questionIndex = 0;
                  answer = 0;
                  score = 0;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                "Try Again",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  questionIndex++;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                "Skip This Question",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return questionIndex >= data.length
        ? ResultScreen(questionLength: data.length, score: score)
        : Scaffold(
            appBar: AppBar(
              title: Text("Score : $score"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (questionIndex < data.length)
                    Text(
                      "${data[questionIndex].number1} ${widget.operation} ${data[questionIndex].number2} = ?",
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.green,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  SizedBox(height: 50),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          if (questionIndex < data.length)
                            _optionButton(data[questionIndex].options[0], () {
                              _updatingAnswer(data[questionIndex].number1,
                                  data[questionIndex].number2);
                              _updatingScore(
                                  context, data[questionIndex].options[0]);
                            }),
                          if (questionIndex < data.length)
                            _optionButton(data[questionIndex].options[1], () {
                              _updatingAnswer(data[questionIndex].number1,
                                  data[questionIndex].number2);
                              _updatingScore(
                                  context, data[questionIndex].options[1]);
                            }),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          if (questionIndex < data.length)
                            _optionButton(data[questionIndex].options[2], () {
                              _updatingAnswer(data[questionIndex].number1,
                                  data[questionIndex].number2);
                              _updatingScore(
                                  context, data[questionIndex].options[2]);
                            }),
                          if (questionIndex < data.length)
                            _optionButton(data[questionIndex].options[3], () {
                              _updatingAnswer(data[questionIndex].number1,
                                  data[questionIndex].number2);
                              _updatingScore(
                                  context, data[questionIndex].options[3]);
                            }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  Widget _optionButton(double option, VoidCallback onPressed) {
    return MaterialButton(
      color: Colors.green,
      height: 100,
      minWidth: 150,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Text(
        "$option",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
