import 'package:flutter/material.dart';
import 'package:store_design_system/atoms/nav_item_atom.dart';
import 'package:store_design_system/foundation/colors_foundation.dart';


class BottomNavigationBarMolecule extends StatefulWidget {
  final List<NavigationItemAtom> items;
  final ValueChanged<int> onTap;
  final int currentIndex;

  const BottomNavigationBarMolecule({
    Key? key,
    required this.items,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _BottomNavigationBarMoleculeState createState() => _BottomNavigationBarMoleculeState();
}

class _BottomNavigationBarMoleculeState extends State<BottomNavigationBarMolecule> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.items.map((item) => item.toBottomNavigationBarItem()).toList(),
      currentIndex: widget.currentIndex,
      selectedItemColor: StoreColorsFoundation.primaryColor,
      onTap: widget.onTap,
    );
  }
}
