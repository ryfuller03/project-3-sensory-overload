import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  final List<int> scoresList;
  const ScoreScreen({super.key, required this.scoresList});

  @override
  State createState() => ScoreScreenState();
}

class ScoreScreenState extends State<ScoreScreen> {

  @override
  Widget build(BuildContext context) {
    widget.scoresList.sort((a, b) => a.compareTo(b));
    if (widget.scoresList.isNotEmpty) {
      return Scaffold(
          appBar: AppBar(
              title: const Text("Your Scores"), backgroundColor: Colors.teal),
          body: ListView.builder(
              key: const Key("Scores List"),
              itemCount: widget.scoresList.length,
              prototypeItem: ListTile(title: Text(widget.scoresList.first.toString())),
              itemBuilder: ((context, index) => ListTile(
                  title: Text("${widget.scoresList[index].toString()}º"),
                  leading: Text((index + 1).toString(),
                      style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))))));
    } else {
      return Scaffold(
          appBar: AppBar(
              title: const Text("Your Scores"), backgroundColor: Colors.teal));
    }
  }
}
