import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/colors_foundation.dart';
import 'package:store_desing_system/foundation/typography_foundation.dart';

class SortButtonAtom extends StatelessWidget {
  final void Function() onTap;

  const SortButtonAtom({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: const [
          Text(
            "Sort",
            style: TextStyle(
              color: StoreColorsFoundation.textColor,
              fontSize: StoreTypographyFoundation.fontSizeH5
            ),
          ),
          Icon(
            Icons.sort,
            color: StoreColorsFoundation.textColor,
          ),
        ],
      ),
    );
  }
}
