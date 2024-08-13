
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
    final GlobalKey<PopupMenuButtonState<String>> key = GlobalKey(debugLabel: 'filterMenuMolecule');

    return PopupMenuButton<String>(
      key: key, 
      onSelected: (select){
      onFilterSelected(select);

      },
      itemBuilder: (context) => filterCategories.map((category) => PopupMenuItem(
        key: Key('filterItem $category'),
        value: category,
        child: Text(category),
      )).toList(),

      child: FilterButtonAtom(
            onTap:  () => key.currentState?.showButtonMenu(),

      ),
    );
  }
}