import 'package:flutter/material.dart';
import 'package:project_3_sensory_overload/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Direction Game',
      home: MyMagnet(),
    );
  }
}

class ScorePage extends StatelessWidget {
  @override
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
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => MyMagnet()));
            },
          ),
        ),
      );
}
