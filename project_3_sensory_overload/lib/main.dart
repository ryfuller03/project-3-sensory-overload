import 'package:flutter/material.dart';
import 'package:project_3_sensory_overload/game.dart';
import 'package:project_3_sensory_overload/scoreboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the Direction',
      home: MyMagnet(),
      //change to game screen when pushed
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}

class ScorePage extends StatefulWidget {
  const ScorePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class GameScreen extends StatelessWidget {
  @override
  State<ScorePage> createState() => _ScorePageState();
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Game Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
            ),
            child: Text('Scores'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScoreScreen()));
            },
          ),
        ),
      );
}

class ScoreScreen extends StatelessWidget {
class _ScorePageState extends State<ScorePage> {
  final List<Score> scoresList = [
    const Score(degree: 12),
    const Score(degree: 20),
    const Score(degree: 8)
  ];

  

  List<Score> _scoreSortHelper(List<Score> scores) {
    List<Score> scoresSorted = [];

    //sort list

    //convert sorted list to maps

    final scoresMap = scores.asMap();

    //change rank to key of map
    for (Score s in scores) {
      //s.rank = scoresMap.keys
    }

    //return sorted list
    return (scoresSorted);
  }

  void _handleScoreAdded(int degreesOff) {
    setState(() {
      print("adding score");
      Score score = Score(degree: degreesOff);
      scoresList.add(score);
      _scoreSortHelper(scoresList);
      //.sort(); //if the list was just int values, this would work. Not sure if it does now.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.teal,
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Score Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
            ),
            child: Text('Game'),
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => GameScreen()));
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: scoresList.map((score) {
            return ScoreItem(
              score: score,
            );
          }).toList(),
        ));
  }
}

//example of getting index of list -> map -> keys

//myList.asMap().entries.map((entry) {
//    int idx = entry.key;
//    String val = entry.value;

//    return something;
//});