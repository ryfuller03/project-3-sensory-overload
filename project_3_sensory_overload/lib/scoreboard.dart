import 'package:flutter/material.dart';

class ScoreboardEntry {
  final int score;
  final String goalDirection;
  ScoreboardEntry({required this.score, required this.goalDirection});

  /// A list of all the properties a ScoreboardEntry has that contribute to its
  /// sort order. The first item in this list is considered first when sorting.
  List<Comparable> get sortOrder => [score, goalDirection];

  /// Compares two `ScoreboardEntry`s by comparing the value of each instance 
  /// variable in the order specified by `sortOrder`. If all values are the 
  /// same, the two `ScoreboardEntry`s are considered equal.
  int compareTo(ScoreboardEntry other) {
    int comparison = 0;
    
    // loop through each sortable property in order and compare this entry's
    // value with the other's. As soon as a non-equal value pair is found, the
    for (var i = 0; i < sortOrder.length; i++) {
      comparison = sortOrder[i].compareTo(other.sortOrder[i]);
      if (comparison != 0) {
        return comparison;
      }
    }

    return comparison;
  }

  @override
  String toString() => 'Score: $score; Goal: $goalDirection';
}

class ScoreScreen extends StatefulWidget {
  final List<ScoreboardEntry> scoresList;
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
                  title: Text(widget.scoresList[index].toString()),
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
