import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/tokens/spacing_token.dart';

class DrawerHeaderMolecule extends StatelessWidget {
  final String imageUrl;
  final String username;

  const DrawerHeaderMolecule({
    super.key,
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: StoreSizesFoundation.paddingL),
      child: Column(
        children: [
          AvatarAtom(
            imageUrl: imageUrl,
            size: 100,
          ),
          const SizedBox(height: StoreSpacingToken.spaceSL),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontSize: StoreTypographyFoundation.fontSizeH4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
