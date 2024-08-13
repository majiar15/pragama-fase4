import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/molecules/filter_menu_molecule.dart';
import 'package:store_design_system/molecules/sort_menu_molecule.dart';
import 'package:store_design_system/organisms/filter_sort_organism.dart';

void main() {
  testWidgets(
      'renders SortMenuMolecule and FilterMenuMolecule and triggers callbacks',
      (WidgetTester tester) async {
    final filterCategories = ['Category 1', 'Category 2', 'Category 3'];
    var selectedSort = '';
    var selectedFilter = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterSortOrganism(
            filterCategories: filterCategories,
            onSortSelected: (sort) {
              selectedSort = sort;
            },
            onFilterSelected: (filter) {
              selectedFilter = filter;
            },
          ),
        ),
      ),
    );

    expect(find.byType(SortMenuMolecule), findsOneWidget);
    expect(find.byType(FilterMenuMolecule), findsOneWidget);

    final sortMenuMolecule = find.byType(SortMenuMolecule);
    await tester.tap(sortMenuMolecule);
    await tester.pump();

    (tester.widget(sortMenuMolecule) as SortMenuMolecule)
        .onSortSelected('Price: Low to High');
    expect(selectedSort, 'Price: Low to High');

    final filterMenuMolecule = find.byType(FilterMenuMolecule);
    await tester.tap(filterMenuMolecule);
    await tester.pump();

    (tester.widget(filterMenuMolecule) as FilterMenuMolecule)
        .onFilterSelected('Category 1');
    expect(selectedFilter, 'Category 1');
  });
}
