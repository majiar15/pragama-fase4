

import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/colors_foundation.dart';
import 'package:store_desing_system/foundation/typography_foundation.dart';

class AppBarBarMolecule extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final List<Widget>? actions;
  static const initTitle  = Text(
    "MY CLOTHING STORE ",
    style: TextStyle(
      color: StoreColorsFoundation.textColor,
      fontSize: StoreTypographyFoundation.fontSizeH3
    )
  );

  const AppBarBarMolecule({
    Key? key,
    this.title = initTitle,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      backgroundColor: StoreColorsFoundation.backgroundColor,
      iconTheme: const IconThemeData(
        color: StoreColorsFoundation.textColor,
      ),
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: const  Border(bottom: BorderSide(color: Colors.transparent, width: 0)),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
