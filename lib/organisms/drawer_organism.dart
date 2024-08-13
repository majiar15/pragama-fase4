import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';

class DrawerOrganism extends StatelessWidget {
  final List<DrawerItemMolecule> items;
  final String name;
  final VoidCallback onClose;
  final VoidCallback onTapLogout;

  const DrawerOrganism({
    super.key,
    required this.items,
    required this.name,
    required this.onClose,
    required this.onTapLogout
    });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeaderMolecule(
                  imageUrl: 'https://i.pinimg.com/originals/61/f7/5e/61f75ea9a680def2ed1c6929fe75aeee.jpg',
                  username: name,
                ),
                ...items
              ],
            ),
          ),
          DrawerItemMolecule(
            key: const Key("drawerLogout"),
            label: 'Cerrar session',
            icon: Icons.logout,
            onTap: onTapLogout
          ),
          const Text(
            "Power by pragma",
            style: TextStyle(
              fontSize: StoreTypographyFoundation.fontSizeH5
            ),
          ),
          const Text(
            "V 1.0.0",
            style: TextStyle(
              fontSize: StoreTypographyFoundation.fontSizeH6
            ),
          ),
          const SizedBox(
            height: StoreSpacingFoundation.md,
          )
        ],
      ),
    );
  }
}
