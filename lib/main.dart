// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';

void main() {
  runApp(const MaterialApp(home: QuestionScreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 235,
            ),
            const Text(
              'Quiz App',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start'),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(20)),
            )
          ],
        ),
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  String title = 'Flutter Bil Bakalım';
  int curretIndex = 0;
  // List<String> answers = ['Cevap1', 'Cevap2', 'Cevap3', 'Cevap3'];

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
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: const Size(370, 47),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                )),
                            onPressed: () => {},
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
