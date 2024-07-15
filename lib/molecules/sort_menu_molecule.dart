import 'package:flutter/material.dart';
import 'package:store_desing_system/atoms/sort_button_atom.dart';

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
            value: "${property}_asc",
            child: Text("$property Ascending"),
          ),
          PopupMenuItem(
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
