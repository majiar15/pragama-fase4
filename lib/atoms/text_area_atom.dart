import 'package:flutter/material.dart';
import 'package:store_desing_system/store_desing_system.dart';

class TextAreaAtom extends StatelessWidget {
  final IconData iconData;
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const TextAreaAtom({
    super.key,
    required this.iconData,
    required this.label,
    required this.controller,
    this.maxLines = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(iconData, color: StoreColorsFoundation.primaryColor),
            const SizedBox(width: StoreSpacingFoundation.s),
            Text(
              label,
              style: const TextStyle(
                fontSize: StoreTypographyFoundation.fontSizeH5,
                fontWeight: StoreTypographyFoundation.fontWeightMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: StoreSpacingFoundation.xs),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(StoreSizesFoundation.borderRadiusM),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(StoreSizesFoundation.borderRadiusM),
              borderSide: const BorderSide(color: StoreColorsFoundation.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
