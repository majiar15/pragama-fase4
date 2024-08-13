import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/atoms/sort_button_atom.dart';
import 'package:store_design_system/molecules/sort_menu_molecule.dart';

void main() {
  group('SortMenuMolecule', () {
    testWidgets('displays sort options when button is tapped',
        (WidgetTester tester) async {
      const properties = ['title', 'price', 'reviews'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SortMenuMolecule(
              onSortSelected: (value) {},
              properties: properties,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SortButtonAtom));
      await tester.pumpAndSettle();

      expect(find.text('${properties[0]} Ascending'), findsOneWidget);
      expect(find.text('${properties[0]} Descending'), findsOneWidget);

      expect(find.text('${properties[1]} Ascending'), findsOneWidget);
      expect(find.text('${properties[1]} Descending'), findsOneWidget);

      expect(find.text('${properties[2]} Ascending'), findsOneWidget);
      expect(find.text('${properties[2]} Descending'), findsOneWidget);
    });

    testWidgets('triggers onSortSelected callback with correct value',
        (WidgetTester tester) async {
      const properties = ['title', 'price', 'reviews'];
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SortMenuMolecule(
              onSortSelected: (value) {
                selectedValue = value;
              },
              properties: properties,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SortButtonAtom));
      await tester.pumpAndSettle();

      await tester.tap(find.text('price Ascending').hitTestable());
      await tester.pumpAndSettle();

      expect(selectedValue, equals('price_asc'));
    });
  });
}
