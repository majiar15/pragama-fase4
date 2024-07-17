import 'package:flutter/material.dart';
import 'package:store_design_system/foundation/colors_foundation.dart';
import 'package:store_design_system/foundation/sizes_foundation.dart';
import 'package:store_design_system/store_design_system.dart';
class ListStarMolecule extends StatelessWidget {
  final Color backgroundActiveColor;
  final Color backgroundDisableColor;
  final double? size;
  final int items;
  final double? rating;

  const ListStarMolecule({
    super.key,
    required this.backgroundActiveColor,
    required this.backgroundDisableColor,
    this.size,
    required this.items,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final double starSize = size ?? StoreSizesFoundation.widthXS;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(items, (index) {
        final double fillPercentage = (rating! - index).clamp(0.0, 1.0);

        return Stack(
          children: [
            StarAtom(
              backgroundColor: backgroundDisableColor,
              size: starSize,
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  stops: [fillPercentage, fillPercentage],
                  colors: [backgroundActiveColor, backgroundDisableColor],
                ).createShader(bounds);
              },
              child: StarAtom(
                backgroundColor: StoreColorsFoundation.backgroundColor,
                size: starSize,
              ),
            ),
          ],
        );
      }),
    );
  }
}
