import 'dart:ffi';

import 'package:flutter/material.dart';

class Score {
  const Score(this.degree);

  final Int degree;
}

class ScoreItem extends StatelessWidget{
  ScoreItem(
    {required this.degree
    required this.onScoreAdded
    }
  )
}


//not sure if this is necessary?
//should the entire scoreboard be a class or just a simpler widget
//with an indefinite number of ScoteItem widgets within?

class Scoreboard extends StatefulWidget{
  Scoreboard(
    {required this.score
  )

}