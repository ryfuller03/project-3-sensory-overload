import 'dart:ffi';

import 'package:flutter/material.dart';

class Score {
  const Score({required this.degree});

  final int degree;
}

class ScoreItem extends StatelessWidget {
  ScoreItem();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

//not sure if this is necessary?
//should the entire scoreboard be a class or just a simpler widget
//with an indefinite number of ScoteItem widgets within?

class Scoreboard {}
