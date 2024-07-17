
import 'package:flutter/material.dart';
import 'package:store_design_system/atoms/filter_button_atom.dart';

class FilterMenuMolecule extends StatelessWidget {
  final List<String> filterCategories;
  final void Function(String) onFilterSelected;


  const FilterMenuMolecule({
    super.key,
    required this.onFilterSelected,
    required this.filterCategories
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<PopupMenuButtonState<String>> _key = GlobalKey();

    return PopupMenuButton<String>(
      key: _key,
      onSelected: onFilterSelected,
      itemBuilder: (context) => filterCategories.map((category) => PopupMenuItem(
        value: category,
        child: Text(category),
      )).toList(),

      child: FilterButtonAtom(
            onTap:  () => _key.currentState?.showButtonMenu(),

      ),
    );
  }
}