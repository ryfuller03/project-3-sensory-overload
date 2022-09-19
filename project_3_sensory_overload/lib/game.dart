import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyScreen());
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  String pickDirection() {
    String goalDirection = "";
    List directions = [
      'North',
      'South',
      'East',
      'West',
      'Northeast',
      'Northwest',
      'Southeast',
      'Southwest'
    ];
    int randomIndex = Random().nextInt(8);
    return directions[randomIndex];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Magnetometer Game',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text("Game")),
          body: Center(
              child: Column(children: [
            Text(
              "Your Goal Direction: ${pickDirection()}",
              textAlign: TextAlign.center,
              textScaleFactor: 2.0,
            )
          ])),
        )); // make the body column;
  }
}
