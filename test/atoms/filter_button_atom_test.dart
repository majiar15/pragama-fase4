import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group("filterButton test ", () {
    testWidgets('FilterButtonAtom displays text and icon correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterButtonAtom(
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Filter'), findsOneWidget);

      expect(find.byIcon(Icons.filter_list), findsOneWidget);
    });

     testWidgets('FilterButtonAtom calls onTap when tapped', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterButtonAtom(
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );


    final Finder textFinder = find.text('Filter');
    final Finder iconFinder = find.byIcon(Icons.filter_list);

    expect(textFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);

    await tester.tap(textFinder);
    await tester.pump();

    expect(tapped, true);
    });
  });
}
