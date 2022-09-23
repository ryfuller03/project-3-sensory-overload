import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter/services.dart';

class Item {
  final String directionName;
  final double directionDegrees;
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
  State createState() => _MyMagnetState();
}

class _MyMagnetState extends State<MyMagnet> {
  Item goalDirection = Item("", 0.0);
  double correctDirection = 0.0;
  int score = 0;
  int previousScore = 0;
  List<double>? _magnetometerValues;
  bool orangeArrowVisible = false;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  final Color themeColor = Colors.teal;

  _MyMagnetState() {
    _setRandomDirection();
  }

  void _setRandomDirection() {
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

  void _showSolution() {
    orangeArrowVisible = true;
    setState(() {
      previousScore = score;
    });
  }

  void _processUserAnswer(double x, double y) {
    // math help from Simon Reid on 09/22/2022
    setState(() {
      correctDirection = (atan(y / x) + pi + (pi / 2));
      correctDirection = x < 0
          ? correctDirection + pi
          : correctDirection; // makes it positive // converts from radians to degrees
      double goalDegreesRadians = goalDirection.getDegrees() * (pi / 180);
      correctDirection = goalDegreesRadians - correctDirection;
      double scoreCalculation = (correctDirection * (180 / pi)).toInt() % 360;
      score = scoreCalculation > 180
          ? (360 - scoreCalculation).toInt()
          : scoreCalculation.toInt(); // calculates user score
      // add score to list
    });
  }

  @override
  Widget build(BuildContext context) {
    final magnetometer =
        _magnetometerValues?.map((double v) => v.toStringAsFixed(1)).toList();

    return Scaffold(
        appBar:
            AppBar(title: Text("Game Screen"), backgroundColor: Colors.teal),
        body: Center(
            child: Column(
          children: [
            Padding(
              // Goal Direction Text
              padding: EdgeInsets.only(top: 50.0),
              child: Text("Goal Direction: ${goalDirection.getDegrees()}",
                  style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
            ),
            Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text("Previous Score: ${previousScore}")),
            Stack(children: [
              Icon(Icons.arrow_upward, size: 100.0),
              orangeArrowVisible == false
                  ? Icon(Icons.arrow_upward, size: 100.0)
                  : Transform.rotate(
                      angle: correctDirection,
                      child: Icon(Icons.arrow_upward,
                          size: 100.0, color: Colors.orange))
            ]),
            Padding(
                // Submit Answer button
                padding: EdgeInsets.only(top: 250.0),
                child: ElevatedButton(
                    child: Text("Submit Answer"),
                    onPressed: _showSolution,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: themeColor))),
            Padding(
                // Gives the player a new direction
                padding: EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                    child: Text("New Direction"),
                    onPressed: _setRandomDirection,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: themeColor)))
          ],
        )));
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    super.dispose();
  }

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    _streamSubscriptions.add(magnetometerEvents.listen((event) => {
          setState(() {
            _magnetometerValues = <double>[event.x, event.y];
            _processUserAnswer(event.x, event.y);
          })
        }));
  }
}

void main() {
  runApp(MaterialApp(title: "Magnet Game", home: MyMagnet()));
}
