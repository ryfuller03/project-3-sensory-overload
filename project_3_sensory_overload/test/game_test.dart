import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_sensory_overload/game.dart';

void main() {
  // Because I am not using a MaterialApp in my build Widget, I create a TestingWidget Widget to wrap it in a Material App for me.
  // Here's where I got this solution: https://stackoverflow.com/questions/48498709/widget-test-fails-with-no-mediaquery-widget-found
  Widget testingWidget({required Widget child}) {
    return MaterialApp(home: child);
  }

  testWidgets('Text and Buttons show up correctly',
      (WidgetTester tester) async {
    // Build the app.
    await tester.pumpWidget(testingWidget(child: const MyMagnet()));

    // Finds both "New Direction" and "Submit Answer" buttons.
    expect(find.byKey(const Key("New Direction Button")), findsOneWidget);
    expect(find.byKey(const Key("Submit Answer Button")), findsOneWidget);

    // Finds both the "Previous Score" and "Goal Direction" text.
    expect(find.byKey(const Key("Previous Score Text")), findsOneWidget);
    expect(find.byKey(const Key("Goal Direction Text")), findsOneWidget);
  });

  testWidgets("'New Direction' button makes Orange Arrow appear",
      (WidgetTester tester) async {
    // Build the app.
    await tester.pumpWidget(testingWidget(child: const MyMagnet()));

    // Because the user hasn't submitted an answer,
    // we should expect the Orange Arrow to not be found.
    expect(find.byKey(const Key("Orange Arrow")), findsNothing);

    // Taps the 'Submit Answer' button and triggers a frame.
    await tester.tap(find.byKey(const Key("Submit Answer Button")));
    await tester.pump();

    // Finds the Orange Arrow after the user submitted an answer.
    expect(find.byKey(const Key("Orange Arrow")), findsOneWidget);
  });

  testWidgets("Score is calculated correctly", (WidgetTester tester) async {
    // Build the app.
    await tester.pumpWidget(testingWidget(child: const MyMagnet()));

    // create a MyMagnetState to interact with its variables and functions.
    MyMagnetState magnetState = MyMagnetState();

    // Set the goal direction to set up for the processUserAnswer function.
    magnetState.goalDirection = Item("South", 180.0);

    // Run processUserAnswer function with a specific angle.
    magnetState.processUserAnswer(1.16, 5.79);

    // Verify that the score we get back is calculated correctly.
    expect(magnetState.score, 168);
  });
}
