import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
class TextAreaAtom extends StatelessWidget {
  final IconData iconData;
  final String label;
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;


  const TextAreaAtom({
    super.key,
    required this.iconData,
    required this.label,
    required this.controller,
    this.maxLines = 5,
    this.validator,

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
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator:validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(StoreSizesFoundation.borderRadiusM),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(StoreSizesFoundation.borderRadiusM),
              borderSide: const BorderSide(color: StoreColorsFoundation.primaryColor),
            ),
            errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(StoreSizesFoundation.borderRadiusM),
              borderSide: const BorderSide(color: StoreColorsFoundation.primaryColor),
            )
          ),
        ),
      ],
    );
  }
}
