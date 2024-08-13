import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group("buttonAtom test", () {
    testWidgets('ButtonAtom renders with correct label and default styles',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonAtom(
              label: 'Click Me',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final buttonStyle = button.style!;

      expect(buttonStyle.backgroundColor!.resolve({}),
          StoreColorsFoundation.primaryColor);

      expect(buttonStyle.foregroundColor!.resolve({}),
          StoreColorsFoundation.onPrimaryColor);

      final textStyle = buttonStyle.textStyle!.resolve({});
      expect(textStyle!.fontSize, StoreTypographyFoundation.fontSizeH4);
      expect(textStyle.fontWeight, StoreTypographyFoundation.fontWeightBold);
    });

    testWidgets('ButtonAtom executes onPressed callback when tapped',
        (WidgetTester tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonAtom(
              label: 'Click Me',
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ButtonAtom));
      await tester.pump();

      expect(buttonPressed, true);
    });

    testWidgets('ButtonAtom shows CircularProgressIndicator when loading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonAtom(
              label: 'Click Me',
              onPressed: () {},
              loading: true,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      expect(find.text('Click Me'), findsNothing);
    });
  });
}
