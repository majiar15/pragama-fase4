import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group("dialog Test", () {
    testWidgets('DialogAtom displays title and content correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogAtom(
              title: 'Dialog Title',
              content: 'This is the content of the dialog.',
              rightButtonText: 'OK',
              onRightButtonPressed: () {},
            ),
          ),
        ),
      );


      await tester.tap(find.byType(DialogAtom));
      await tester.pumpAndSettle();


      expect(find.text('Dialog Title'), findsOneWidget);


      expect(find.text('This is the content of the dialog.'), findsOneWidget);


      expect(find.text('OK'), findsOneWidget);


      expect(find.byType(TextButton), findsNWidgets(1));
    });

    testWidgets(
        'DialogAtom displays left button when leftButtonText is provided',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogAtom(
              title: 'Dialog Title',
              content: 'This is the content of the dialog.',
              rightButtonText: 'OK',
              leftButtonText: 'Cancel',
              onRightButtonPressed: () {},
              onLeftButtonPressed: () {},
            ),
          ),
        ),
      );


      await tester.tap(find.byType(DialogAtom));
      await tester.pumpAndSettle();


      expect(find.text('Cancel'), findsOneWidget);


      expect(find.text('OK'), findsOneWidget);


      expect(find.byType(TextButton), findsNWidgets(2));
    });

    testWidgets(
        'DialogAtom triggers onRightButtonPressed when right button is pressed',
        (WidgetTester tester) async {
      bool rightButtonPressed = false;


      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogAtom(
              title: 'Dialog Title',
              content: 'This is the content of the dialog.',
              rightButtonText: 'OK',
              onRightButtonPressed: () {
                rightButtonPressed = true;
              },
            ),
          ),
        ),
      );


      await tester.tap(find.byType(DialogAtom));
      await tester.pumpAndSettle();


      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();


      expect(rightButtonPressed, true);
    });

    testWidgets(
        'DialogAtom triggers onLeftButtonPressed when left button is pressed',
        (WidgetTester tester) async {
      bool leftButtonPressed = false;


      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogAtom(
              title: 'Dialog Title',
              content: 'This is the content of the dialog.',
              rightButtonText: 'OK',
              leftButtonText: 'Cancel',
              onRightButtonPressed: () {},
              onLeftButtonPressed: () {
                leftButtonPressed = true;
              },
            ),
          ),
        ),
      );


      await tester.tap(find.byType(DialogAtom));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(leftButtonPressed, true);
    });
  });
}
