// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(199, 78, 68, 193),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 235,
            ),
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                'Quiz App',
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: OutlinedButton.icon(
                onPressed: () {
                  startQuiz();
                },
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text(
                  'Start',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(220, 60)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
