import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group("start atom", () {
    testWidgets('renders star icon with default values',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarAtom(),
          ),
        ),
      );

      final icon = find.byIcon(Icons.star);
      expect(icon, findsOneWidget);

      final iconWidget = tester.widget<Icon>(icon);
      expect(iconWidget.color, StoreColorsFoundation.goldColor);
      expect(iconWidget.size, StoreSizesFoundation.widthXS);
    });

    testWidgets('renders star icon with custom color and size',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarAtom(
              backgroundColor: Colors.red,
              size: 50.0,
            ),
          ),
        ),
      );


      final icon = find.byIcon(Icons.star);
      expect(icon, findsOneWidget);

      final iconWidget = tester.widget<Icon>(icon);
      expect(iconWidget.color, Colors.red);
      expect(iconWidget.size, 50.0);
    });
  });
}
