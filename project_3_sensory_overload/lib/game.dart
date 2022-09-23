import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Item {
  String directionName;
  double directionDegrees;
  Item(this.directionName, this.directionDegrees);

  String getName() {
    return directionName;
  }

  double getDegrees() {
    return directionDegrees;
  }
}

class MyMagnet extends StatefulWidget {
  const MyMagnet({super.key});

  @override
  State createState() => MyMagnetState();
}

class MyMagnetState extends State<MyMagnet> {
  Item goalDirection = Item("", 0.0);
  double correctDirection = 0.0;
  int score = 0;
  int previousScore = 0;
  bool orangeArrowVisible = false;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  final Color themeColor = Colors.teal;

  MyMagnetState() {
    setRandomDirection();
  }

  void setRandomDirection() {
    List directions = [
      Item("North", 0.0),
      Item("South", 180.0),
      Item("East", 90.0),
      Item("West", 270.0)
    ];
    int randomIndex = Random().nextInt(4);
    goalDirection = directions[randomIndex];
    orangeArrowVisible = false;
  }

  void showSolution() {
    orangeArrowVisible = true;
    previousScore = score;
  }

  void processUserAnswer(double x, double y) {
    // math help from Simon Reid on 09/22/2022
    correctDirection = (atan(y / x) + pi + (pi / 2));
    correctDirection = x < 0
        ? correctDirection + pi
        : correctDirection; // makes it positive // converts from radians to degrees
    double goalDegreesRadians = goalDirection.getDegrees() * (pi / 180);
    correctDirection = goalDegreesRadians - correctDirection;
    double scoreCalculation = (correctDirection * (180 / pi)).toInt() % 360;
    score = scoreCalculation > 180
        ? (360 - scoreCalculation).toInt()
        : scoreCalculation.toInt();
    // add score to list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Game Screen"), backgroundColor: Colors.teal),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 0.0),
                key: const Key("Goal Direction Text"),
                child: Text("Goal Direction: ${goalDirection.getName()}",
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.center)),
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Previous Score: $previousScore",
                    key: const Key("Previous Score Text"))),
            Stack(children: [
              const Icon(Icons.arrow_upward, size: 100.0),
              orangeArrowVisible == false
                  ? const Icon(Icons.arrow_upward, size: 100.0)
                  : Transform.rotate(
                      angle: correctDirection,
                      key: const Key("Orange Arrow"),
                      child: const Icon(Icons.arrow_upward,
                          size: 100.0, color: Colors.orange))
            ]),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ElevatedButton(
                    onPressed: showSolution,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: themeColor),
                    key: const Key("Submit Answer Button"),
                    child: const Text("Submit Answer"))),
            Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: ElevatedButton(
                    onPressed: setRandomDirection,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: themeColor),
                    key: const Key("New Direction Button"),
                    child: const Text("New Direction")))
          ],
        )));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(magnetometerEvents.listen((event) => {
          setState(() {
            processUserAnswer(event.x, event.y);
          })
        }));
  }
}

void main() {
  runApp(const MaterialApp(title: "Magnet Game", home: MyMagnet()));
}
