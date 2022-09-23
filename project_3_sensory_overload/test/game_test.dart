import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_sensory_overload/game.dart';

import 'package:project_3_sensory_overload/main.dart';

void main() {
  /*
  TESTS TO MAKE:
* Texts show up correctly
* Orange arrow appears and disappears at the right times
* Score calculations are correct/listener works
* New direction button works
  */

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
}
