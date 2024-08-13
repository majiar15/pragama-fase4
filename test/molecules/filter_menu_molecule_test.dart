import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/atoms/filter_button_atom.dart';
import 'package:store_design_system/molecules/filter_menu_molecule.dart';

void main() {
  group('FilterMenuMolecule', () {
    testWidgets('displays filter categories in popup menu', (WidgetTester tester) async {
      final filterCategories = ['Category 1', 'Category 2', 'Category 3'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 300,
              child: FilterMenuMolecule(
                filterCategories: filterCategories,
                onFilterSelected: (category) {},
              ),
            ),
          ),
        ),
      );


      await tester.tap(find.byType(FilterButtonAtom));
      await tester.pumpAndSettle();


      for (final category in filterCategories) {
        expect(find.text(category), findsOneWidget);
      }
    });

    testWidgets('calls onFilterSelected with the correct value when a filter is selected', (WidgetTester tester) async {
      final filterCategories = ['Category 1', 'Category 2', 'Category 3'];
      String? selectedCategory;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 300,
              child: FilterMenuMolecule(
                filterCategories: filterCategories,
                onFilterSelected: (category) {
                  selectedCategory = category;
                },
              ),
            ),
          ),
        ),
      );


      await tester.tap(find.byType(FilterButtonAtom));
      await tester.pumpAndSettle();


      await tester.tap(find.text('Category 2'));
      await tester.pumpAndSettle();


      expect(selectedCategory, 'Category 2');
    });
  });
}
