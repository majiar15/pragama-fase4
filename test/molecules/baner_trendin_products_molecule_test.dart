import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group("banner test", () {
    testWidgets('renders correctly with date and triggers onTapButton callback',
        (WidgetTester tester) async {
      const testDate = '2024-08-12';
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BannerTrendingProductsMolecule(
              date: testDate,
              onTapButton: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Productos en Oferta'), findsOneWidget);
      expect(find.text('Ultimo Dia $testDate'), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      expect(find.text('View all'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

      await tester.tap(find.byType(OutlinedButton));
      await tester.pumpAndSettle();

      expect(wasTapped, isTrue);
    });

    testWidgets('displays the correct styles and layout',
        (WidgetTester tester) async {
      const testDate = '2024-08-12';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BannerTrendingProductsMolecule(
              date: testDate,
              onTapButton: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, StoreColorsFoundation.primaryColor);
      expect(boxDecoration.borderRadius,
          BorderRadius.circular(StoreSizesFoundation.paddingM));

      final column = find.byType(Column);
      expect(column, findsOneWidget);
      final row = find.byType(Row);
      expect(row, findsNWidgets(3));

      final textStyle =
          tester.widget<Text>(find.text('Productos en Oferta')).style;
      expect(textStyle?.color, StoreColorsFoundation.onPrimaryColor);
      expect(textStyle?.fontSize, StoreTypographyFoundation.fontSizeH4);
      expect(textStyle?.fontWeight, FontWeight.bold);
    });
  });
}
