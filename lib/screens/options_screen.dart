import 'package:flutter/material.dart';
import 'package:virash_task/screens/quiz_screen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key key}) : super(key: key);

  void _goToQuizScreen({
    @required BuildContext context,
    @required String operation,
  }) {
    print(operation);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizScreen(operation: operation),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buttonWidget(
                  imagePath: "assets/images/plus.png",
                  onPressed: () => _goToQuizScreen(
                    context: context,
                    operation: "+",
                  ),
                ),
                _buttonWidget(
                  imagePath: "assets/images/subtract.png",
                  onPressed: () => _goToQuizScreen(
                    context: context,
                    operation: "-",
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buttonWidget(
                  imagePath: "assets/images/multiply-mathematical-sign.png",
                  onPressed: () => _goToQuizScreen(
                    context: context,
                    operation: "*",
                  ),
                ),
                _buttonWidget(
                  imagePath: "assets/images/divide.png",
                  onPressed: () => _goToQuizScreen(
                    context: context,
                    operation: "/",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget({
    String imagePath,
    VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(500),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
