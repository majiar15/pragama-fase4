import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group('ListStarMolecule', () {
    testWidgets('displays the correct number of stars',
        (WidgetTester tester) async {
      const backgroundActiveColor = Colors.yellow;
      const backgroundDisableColor = Colors.grey;
      const items = 5;
      const rating = 3.5;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ListStarMolecule(
              backgroundActiveColor: backgroundActiveColor,
              backgroundDisableColor: backgroundDisableColor,
              items: 5,
              rating: rating,
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(StarAtom), findsNWidgets(items * 2));
    });

    testWidgets('fills stars according to the rating',
        (WidgetTester tester) async {
      const backgroundActiveColor = Colors.yellow;
      const backgroundDisableColor = Colors.grey;
      const size = 24.0;
      const items = 5;
      const rating = 3.5;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ListStarMolecule(
              backgroundActiveColor: backgroundActiveColor,
              backgroundDisableColor: backgroundDisableColor,
              size: size,
              items: items,
              rating: rating,
            ),
          ),
        ),
      );

      final starFinder = find.byType(StarAtom);

      for (var i = 0; i < items; i++) {
        final baseStar = tester.widget<StarAtom>(starFinder.at(i * 2));
        final gradientStar = tester.widget<StarAtom>(starFinder.at(i * 2 + 1));

        expect(baseStar.backgroundColor, equals(backgroundDisableColor));

        if (i < rating) {
          expect(gradientStar.backgroundColor,
              equals(StoreColorsFoundation.backgroundColor));
        }
      }
    });
  });
}
