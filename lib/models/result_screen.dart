// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';
import 'package:introapp/models/quiz_question.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(this.correctAnswer, this.totalAnswer, this._activeScreenName,
      this.userAnswers,
      {Key? key})
      : super(key: key);

  int correctAnswer;
  int totalAnswer;
  var _activeScreenName = 'start-screen';
  List<String> userAnswers = List.filled(Questions.length, '');

  void startNewTest() {
    setState() {
      _activeScreenName = 'start-screen';
      correctAnswer = 0;
      userAnswers.clear();
    }
  }

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(199, 78, 68, 193),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 82,
              icon: const Icon(Icons.check, color: Colors.greenAccent),
              onPressed: () {},
            ),
            const Text(
              'Tebrikler',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 10, left: 10),
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      "Doğru Cevaplar: ${widget.correctAnswer / widget.totalAnswer}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  Text(
                    'Yanlış Cevaplar: ${widget.totalAnswer - widget.correctAnswer}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  widget.startNewTest();
                },
                child: const Text('Yeniden Başla'))
          ],
        ),
      ),
    );
  }
}
