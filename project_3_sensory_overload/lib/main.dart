import 'package:flutter/material.dart';
import 'package:project_3_sensory_overload/scoreboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Direction Game',
      home: MyHomePage(),
      //change to game screen when pushed
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
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

//example of getting index of list -> map -> keys

//myList.asMap().entries.map((entry) {
//    int idx = entry.key;
//    String val = entry.value;

//    return something;
//});