import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/colors_foundation.dart';
import 'package:store_desing_system/foundation/typography_foundation.dart';
import 'package:store_desing_system/store_desing_system.dart';

class ButtonAtom extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Size? size;

  const ButtonAtom({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.size,
  });

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: size ?? Size(buttonWidth, 50),
        backgroundColor: backgroundColor ?? StoreColorsFoundation.primaryColor,
        foregroundColor: textColor ?? StoreColorsFoundation.onPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( borderRadius ?? StoreSpacingFoundation.xs),
          side: BorderSide(
            color: backgroundColor ?? StoreColorsFoundation.primaryColor,
            width: 1.0,
          ),
        ),
        textStyle: const  TextStyle(
          fontSize: StoreTypographyFoundation.fontSizeH4,
          fontWeight: StoreTypographyFoundation.fontWeightBold
        ),
      ),
      child: Text(label),
    );
  }
}
