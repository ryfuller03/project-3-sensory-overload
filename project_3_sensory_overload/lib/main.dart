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
        home: MyMagnet()
    );
  }
}
