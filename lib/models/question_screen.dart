// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:introapp/models/main.dart';
import 'package:introapp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.finishPage, {super.key});
  final void Function() finishPage;

  @override
  State<StatefulWidget> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  String title = 'Flutter Bil Bakalım';
  int curretIndex = 0;

  List<String> userAnswers = List.filled(Questions.length, '');

  void nextQuestion() {
    setState(() {
      if (curretIndex == Questions.length) return;
      if (curretIndex < Questions.length - 1) {
        curretIndex++;
      }
    });
  }

  void previousQuestion() {
    setState(() {
      if (curretIndex > 0) {
        curretIndex--;
      }
    });
  }

  void selectAnswer(String answer) {
    setState(() {
      userAnswers[curretIndex] = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = Questions[curretIndex].question;
    final List options = Questions[curretIndex].options;

    return Scaffold(
        backgroundColor: const Color.fromARGB(199, 78, 68, 193),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                ),
                child: Text(
                  title,
                  style:
                      const TextStyle(fontSize: 35, color: Colors.amberAccent),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(question,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            )),
                      ),
                    ),
                    ...options.map(
                      (option) {
                        final isCorrectAnswer =
                            option == Questions[curretIndex].correctAnswer;
                        final isSelectedAnswer =
                            userAnswers[curretIndex] == option;
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isSelectedAnswer
                                    ? (isCorrectAnswer
                                        ? Colors.green
                                        : Colors.red)
                                    : Colors.white,
                                fixedSize: const Size(370, 47),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                )),
                            onPressed: () => {selectAnswer(option)},
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              // padding: const EdgeInsets.all(20.0),
                              child: Text(
                                option,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  fixedSize: const Size(150, 40),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  )),
                              onPressed: previousQuestion,
                              child: const Text(
                                'Previous',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  backgroundColor: Colors.amberAccent,
                                  fixedSize: const Size(150, 40),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  )),
                              onPressed: nextQuestion,
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(199, 78, 68, 193)),
                              )),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          widget.finishPage();
                        },
                        child: const Text('Finish'))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
