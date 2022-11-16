import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_sensory_overload/scoreboard.dart';

void main() {
  
  test('ScoreboardEntries sort correctly', () {
    ScoreboardEntry a = ScoreboardEntry(score: 1, goalDirection: "North");
    ScoreboardEntry b = ScoreboardEntry(score: 2, goalDirection: "North");
    
    expect(a.compareTo(b) < 0, true, 
      reason: 'A score of 1 should be lesser than a score of 2');
    
    a = ScoreboardEntry(score: 3, goalDirection: "North");
    b = ScoreboardEntry(score: 3, goalDirection: "East");

    expect(a.compareTo(b) > 0, true, 
      reason: 'A goal of "North" should be greater than a goal of "East"');
    
    a = ScoreboardEntry(score: 4, goalDirection: "South");
    b = ScoreboardEntry(score: 4, goalDirection: "South");

    expect(a.compareTo(b), 0,
      reason: 'Both ScoreboardEntries have the same score and goal');
  });
}
