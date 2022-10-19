import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScoreScreen extends StatefulWidget {
  List<int> scoresList;
  ScoreScreen({super.key, required this.scoresList});

  @override
  // ignore: no_logic_in_create_state
  State createState() => ScoreScreenState(scoresList);
}

class ScoreScreenState extends State<ScoreScreen> {
  List<int> scoresList;

  ScoreScreenState(this.scoresList);

  @override
  Widget build(BuildContext context) {
    scoresList.sort((a, b) => a.compareTo(b));
    return Scaffold(
        appBar: AppBar(
            title: const Text("Your Scores"), backgroundColor: Colors.teal),
        body: ListView.builder(
            key: const Key("Scores List"),
            itemCount: scoresList.length,
            prototypeItem: ListTile(title: Text(scoresList.first.toString())),
            itemBuilder: ((context, index) => ListTile(
                title: Text(scoresList[index].toString() + "º"),
                leading: Text((index + 1).toString(),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold))))));
  }
}
