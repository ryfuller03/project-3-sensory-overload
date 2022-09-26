import 'package:flutter/material.dart';
import 'package:project_3_sensory_overload/game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, scoresList});
  final List<int> scoresList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Direction Game',
        home: MyMagnet(
          scoresList: scoresList,
        ));
  }
}
