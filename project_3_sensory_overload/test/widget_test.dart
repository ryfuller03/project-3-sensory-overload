import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_sensory_overload/game.dart';
import 'package:project_3_sensory_overload/main.dart';

void main() {
  // Because I am not using a MaterialApp in my build Widget, I create a TestingWidget Widget to wrap it in a Material App for me.
  // Here's where I got this solution: https://stackoverflow.com/questions/48498709/widget-test-fails-with-no-mediaquery-widget-found
  Widget testingWidget({required Widget child}) {
    return MaterialApp(home: child);
  }

  // A sorted list for testing purposes.
  List<int> scoresListTest = [0, 47, 65, 82, 103, 156];

  testWidgets('Text and Buttons show up correctly',
      (WidgetTester tester) async {
    // Build the app.
    await tester
        .pumpWidget(testingWidget(child: MyMagnet(scoresList: scoresListTest)));

    // Finds both "New Direction" and "Submit Answer" buttons.
    expect(find.byKey(const Key("New Direction Button")), findsOneWidget);
    expect(find.byKey(const Key("Submit Answer Button")), findsOneWidget);

    // Finds both the "Previous Score" and "Goal Direction" text.
    expect(find.byKey(const Key("Previous Score Text")), findsOneWidget);
    expect(find.byKey(const Key("Goal Direction Text")), findsOneWidget);
  });

  testWidgets("'Submit Answer Button' makes Orange Arrow appear",
      (WidgetTester tester) async {
    // Build the app.
    await tester
        .pumpWidget(testingWidget(child: MyMagnet(scoresList: scoresListTest)));

    // Taps the "Submit Answer" button and updates the frames until no more
    // frames need to be drawn.
    await tester.tap(find.byKey(const Key("Submit Answer Button")));
    await tester.pumpAndSettle();

    // Finds the Orange Arrow after the "Submit Answer" button is tapped.
    expect(find.byKey(const Key("Orange Arrow")), findsOneWidget);
  });

  testWidgets("Score is calculated correctly", (WidgetTester tester) async {
    // Build the app.
    await tester.pumpWidget(testingWidget(
        child: MyMagnet(
      scoresList: scoresListTest,
    )));

    // create a MyMagnetState to interact with its variables and functions.
    MyMagnetState magnetState = MyMagnetState();

    // Set the goal direction to set up for the processUserAnswer function.
    magnetState.goalDirection = Item("South", 180.0);

    // Run processUserAnswer function with a specific angle.
    magnetState.processUserAnswer(1.16, 5.79);

    // Verify that the score we get back is calculated correctly.
    expect(magnetState.score, 168);
  });

  testWidgets("'Scores Screen' Button sends player to Scores Screen",
      // Build the app.
      (WidgetTester tester) async {
    await tester
        .pumpWidget(testingWidget(child: MyMagnet(scoresList: scoresListTest)));

    // Taps the "Scores Screen Button" and waits until no more frames need
    // to be drawn.
    await tester.tap(find.byKey(const Key("Scores Screen Button")));
    await tester.pumpAndSettle();

    // Finds the Scores List widget that only displays on the Scores Screen.
    expect(find.byKey(const Key("Scores List")), findsOneWidget);
  });

  testWidgets("Score is sorted and displayed correctly",
      (WidgetTester tester) async {
    // Build the app.
    await tester
        .pumpWidget(testingWidget(child: MyMagnet(scoresList: scoresListTest)));

    // Add 53 to the test scoresList.
    scoresListTest.add(53);

    // Go to the Scores Screen, which automatically sorts scoresList.
    await tester.tap(find.byKey(const Key("Scores Screen Button")));
    await tester.pumpAndSettle();

    // Ensure that the test new value is in scoresList.
    final textFinder = find.text("53");
    expect(textFinder, findsOneWidget);

    // Ensure the newly added value is in the correct index in scoresList.
    expect(scoresListTest[3], 53);
  });
}
