import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';
import 'package:introapp/models/question_screen.dart';
import 'package:introapp/models/start_screen.dart';
import 'package:introapp/models/result_screen.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({Key? key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  var _activeScreenName = 'start-screen';
  int correctAnswer = 0;
  int totalQuestion = Questions.length;
  List<String> userAnswers = List.filled(Questions.length, '');

  void changeScreen() {
    setState(() {
      _activeScreenName = 'quiz-screen';
    });
  }

  void changeResultScreen() {
    setState(() {
      _activeScreenName = 'result-screen';
    });
  }

  void onAnswerSubmitted(bool isCorrect) {
    if (isCorrect) {
      correctAnswer++;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(changeScreen);

    if (_activeScreenName == 'quiz-screen') {
      activeScreen = QuestionScreen(changeResultScreen);
    } else if (_activeScreenName == 'result-screen') {
      activeScreen = ResultScreen(
        correctAnswer,
        totalQuestion,
        _activeScreenName,
        userAnswers,
      );
    }
    return Container(child: activeScreen);
  }
}
