import 'package:flutter/material.dart';
import 'package:store_design_system/foundation/colors_foundation.dart';

class NavigationItemAtom {
  final IconData icon;
  final String label;

  const NavigationItemAtom({
    required this.icon,
    required this.label,
  });

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
