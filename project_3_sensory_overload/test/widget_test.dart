// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_3_sensory_overload/main.dart';

void main() {
  testWidgets('Scoreboard had nothing in it', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    //first makes sure a list is there
    expect(find.byType(ListView), findsOneWidget);

    //then makes sure the list has nothing in it
    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('_HandleNewItem add an item and sorts the list',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    //first add new item

    //check if sorted
  });

  // testWidgets()
}
