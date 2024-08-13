import 'package:flutter/material.dart';
import 'package:store_design_system/atoms/sort_button_atom.dart';

class SortMenuMolecule extends StatelessWidget {
  final void Function(String) onSortSelected;
  final List<String> properties;

  const SortMenuMolecule(
      {super.key,
      required this.onSortSelected,
      this.properties = const ["title", "price", "reviews"]});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<PopupMenuButtonState<String>> _key = GlobalKey();
    return PopupMenuButton<String>(
      key: _key,
      onSelected: onSortSelected,
      itemBuilder: (context) => properties.expand((property) {
        return [
          PopupMenuItem(
            key: Key('sort Item ${property}_asc'),
            value: "${property}_asc",
            child: Text("$property Ascending"),
          ),
          PopupMenuItem(
            key: Key('sort Item ${property}_desc'),
            value: "${property}_desc",
            child: Text("$property Descending"),
          )
        ];
      }).toList(),
      child: SortButtonAtom(
        onTap: () => _key.currentState?.showButtonMenu(),
      ),
    );
  }
}
