import 'package:flutter/material.dart';

class DrawerItemMolecule extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const DrawerItemMolecule({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }
}
