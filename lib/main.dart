import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 2, 74),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Özge Akıncı',
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
            Text(
              'Tobeto-Mobil Geliştirici 1A',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Text(
              '31.10.2023',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  ));
}
