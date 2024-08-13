import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {

  group('SortButtonAtom', () {
    testWidgets('displays the correct text and icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SortButtonAtom(
              onTap: () {  },
            ),
          ),
        ),
      );

      expect(find.text('Sort'), findsOneWidget);

      expect(find.byIcon(Icons.sort), findsOneWidget);
    });

    testWidgets('SortButtonAtom widget test', (WidgetTester tester) async {
      bool onTapExecuted = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              height: 200,
              child: SortButtonAtom(
                onTap: () {
                  onTapExecuted = true;
                },
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Sort'));
      await tester.pumpAndSettle();

      expect(onTapExecuted, true);
    });
  });
}
