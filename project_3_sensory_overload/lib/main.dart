import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Direction Game',
      home: MyMagnet(),
      //change to game screen when pushed
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyMagnet extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => ScorePage()));
            },
          ),
        ),
      );
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
