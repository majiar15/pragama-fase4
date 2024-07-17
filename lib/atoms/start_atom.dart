import 'package:flutter/material.dart';
import 'package:store_design_system/foundation/colors_foundation.dart';
import 'package:store_design_system/foundation/sizes_foundation.dart';

class StarAtom extends StatelessWidget {
  final Color? backgroundColor;
  final double? size;

  const StarAtom({
    super.key,
    this.backgroundColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: backgroundColor ?? StoreColorsFoundation.goldColor,
      size: size ?? StoreSizesFoundation.widthXS,
    );
  }
}
