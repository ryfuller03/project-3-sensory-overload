import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
  double goalDirectionDegrees = 0.0;
  double playerDirectionDegrees = 0.0;

  void _setRandomDirection() {
    setState(() {
      List directions = [
        Item("North", 0.0),
        Item("South", 180.0),
        Item("East", 90.0),
        Item("West", 270.0),
        Item("Northeast", 45.0),
        Item("Northwest", 315.0),
        Item("Southeast", 135.0),
        Item("Southwest", 225.0)
      ];
      int randomIndex = Random().nextInt(8);
      goalDirection = directions[randomIndex];
    });
  }

  void _ProcessUserAnswer() {
    double score = (goalDirectionDegrees - playerDirectionDegrees).abs();
  }

  @override
  Widget build(BuildContext context) {
    _setRandomDirection();
    return Scaffold(
        appBar: AppBar(title: Text("Game Screen")),
        body: Center(
            child: Column(
          children: [
            Padding(
              // Goal Direction Text
              padding: EdgeInsets.only(top: 50.0),
              child: Text("Goal Direction: ${goalDirection.getName()}",
                  style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
            ),
            const Padding(
                // Arrow that shows your direction
                padding: EdgeInsets.only(top: 60.0),
                child: Icon(Icons.arrow_upward, size: 64.0)),
            Padding(
                padding: EdgeInsets.only(top: 300.0),
                child: ElevatedButton(
                    child: Text("New Direction"),
                    onPressed: _setRandomDirection))
          ],
        )));
  }
}

void main() {
  runApp(const MaterialApp(title: "Magnet Game", home: MyMagnet()));
}

// TODO: add gyroscope implementation and subtraction and stuff
