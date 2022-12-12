import 'package:flutter/material.dart';
import 'package:project_3_sensory_overload/game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, scoresList});
  final List<int> scoresList = [];
  final List<String> directionList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Direction Game',
        // Set Digital as the default app font.
        theme: ThemeData(fontFamily: 'Digital'),
        home: MyMagnet(
          scoresList: scoresList,
          directionList: directionList,
        ));
  }
}
