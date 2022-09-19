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
  const MyMagnet(
      {super.key,
      required goalDirectionName,
      required goalDirectionDegrees,
      required playerDirectionDegrees});

  @override
  State createState() => _MyMagnetState();
}

class _MyMagnetState extends State<MyMagnet> {
  Item goalDirection = Item("", 0.0);
  double goalDirectionDegrees = 0.0;
  double playerDirectionDegrees = 0.0;
  void _setRandomDirection(MyMagnet magnet) {
    setState(() {
      List directions = [
        Item("North", 0.0),
        Item("South", 180.0),
        Item("East", 90.0),
        Item("West", 270.0)
      ];
      int randomIndex = Random().nextInt(5);
      goalDirection = directions[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Game Screen")));
  }
}
