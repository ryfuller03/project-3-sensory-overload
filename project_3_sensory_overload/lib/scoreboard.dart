import 'dart:ffi';

import 'package:flutter/material.dart';

class Score {
  const Score({required this.degree});

  final int degree;
  //final int rank;
}

class ScoreItem extends StatelessWidget {
  ScoreItem({required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(score.degree.toString()));
  }
}
