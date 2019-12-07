import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:take_note/main.dart';

void main() {
  testWidgets('Finds the app title', (WidgetTester tester) async {
    await tester.pumpWidget(MyNotes());
    expect(find.text('My Notes!'), findsOneWidget);
  });

  testWidgets('Add a note after click', (WidgetTester tester) async {
    await tester.pumpWidget(MyNotes());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('This is note 0'), findsOneWidget);
  });
}
