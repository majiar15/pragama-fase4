import 'package:flutter/material.dart';
import 'package:store_design_system/molecules/filter_menu_molecule.dart';
import 'package:store_design_system/molecules/sort_menu_molecule.dart';

class FilterSortOrganism extends StatelessWidget {
  final List<String> filterCategories;
  final void Function(String) onSortSelected;
  final void Function(String) onFilterSelected;

  const FilterSortOrganism({
    super.key,
    required this.filterCategories,
    required this.onSortSelected,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SortMenuMolecule(
          onSortSelected:onSortSelected,
        ),
        const SizedBox(width: 8),
        FilterMenuMolecule(
          filterCategories: filterCategories,
          onFilterSelected: onFilterSelected
        ),
      ],
    );
  }
}
