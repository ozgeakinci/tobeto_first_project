import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 2, 74),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Image.asset(
                "assets/ozge_akinci.jpg",
                width: 300,
                height: 300,
              ),
            ),
            const Text(
              'Özge Akıncı',
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
            const Text(
              'Tobeto-Mobil Geliştirici 1A',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const Text(
              '31.10.2023',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  ));
}
