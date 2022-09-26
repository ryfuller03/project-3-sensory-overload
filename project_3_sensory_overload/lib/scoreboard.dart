import 'dart:ffi';

import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  List<int> scoresList;
  ScoreScreen({super.key, required this.scoresList});

  @override
  State createState() => ScoreScreenState(scoresList);
}

class ScoreScreenState extends State<ScoreScreen> {
  List<int> scoresList;

  ScoreScreenState(this.scoresList);

  @override
  Widget build(BuildContext context) {
    scoresList.sort((a, b) => a.compareTo(b));
    return Scaffold(
        appBar: AppBar(title: Text("Scores Screen")),
        body: ListView.builder(
            itemCount: scoresList.length,
            prototypeItem: ListTile(title: Text(scoresList.first.toString())),
            itemBuilder: ((context, index) =>
                ListTile(title: Text(scoresList[index].toString())))));
  }
}
