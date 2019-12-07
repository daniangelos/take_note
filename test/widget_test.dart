import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:take_note/main.dart';

void main() {
  testWidgets('Finds the app title', (WidgetTester tester) async {
    await tester.pumpWidget(MyNotes());
    expect(find.text('My Notes!'), findsOneWidget);
  });

  testWidgets('Adds a note after click', (WidgetTester tester) async {
    await tester.pumpWidget(MyNotes());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'new note');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('new note'), findsOneWidget);
  });

  testWidgets('deletes a note after click', (WidgetTester tester) async {
    await tester.pumpWidget(MyNotes());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'new note');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();
    expect(find.text('new note'), findsNothing);
  });
}
