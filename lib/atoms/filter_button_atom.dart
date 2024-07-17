
import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
class FilterButtonAtom extends StatelessWidget {
  final void Function() onTap;

  const FilterButtonAtom({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: const [
          Text(
            "Filter",
            style: TextStyle(
              color: StoreColorsFoundation.textColor,
              fontSize: StoreTypographyFoundation.fontSizeH5
            ),
          ),
          Icon(
            Icons.filter_list,
            color: StoreColorsFoundation.textColor,
          ),
        ],
      ),
    );
  }
}
