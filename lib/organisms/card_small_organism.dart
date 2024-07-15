import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/typography_foundation.dart';
import 'package:store_desing_system/store_desing_system.dart';

class CardSmallOrganism extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double originalPrice;
  final int? discountPercentage;
  void Function() onTapCard;

  CardSmallOrganism({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.originalPrice,
    this.discountPercentage,
    required this.onTapCard,
  });

  double get discountedPrice {
    if (discountPercentage != null &&
        discountPercentage! > 0 &&
        discountPercentage! <= 100) {
      return (originalPrice * (1 - discountPercentage! / 100));
    }
    return originalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: SizedBox(
        width: 200,
        height: 300,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final double width =
              constraints.maxWidth - (StoreSizesFoundation.borderRadiusM * 4);
          final double height =
              constraints.maxHeight - (StoreSizesFoundation.borderRadiusM * 4);
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(StoreSizesFoundation.borderRadiusL),
            ),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(StoreSizesFoundation.borderRadiusM),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.5,
                    child: ImageAtom(
                      src: imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8.0),
                        Text(
                          title,
                          style: const TextStyle(
                            fontFamily: StoreTypographyFoundation.familyHeadings,
                            fontSize: StoreTypographyFoundation.fontSizeH5,
                            fontWeight: StoreTypographyFoundation.fontWeightBold,
                            overflow: TextOverflow.ellipsis
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: StoreTypographyFoundation.familyBody,
                            fontSize: StoreTypographyFoundation.fontSizeBodyText,
                            fontWeight:
                                StoreTypographyFoundation.fontWeightRegular,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                         FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "\$${discountedPrice.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontFamily: StoreTypographyFoundation.familyBody,
                                  fontSize: StoreTypographyFoundation.fontSizeH6,
                                  fontWeight:
                                      StoreTypographyFoundation.fontWeightBold,
                                ),
                              ),
                            ),
                        Row(
                          children: [
                           
                           
                            if (discountPercentage != null &&
                                discountPercentage! > 0)
                              FittedBox(
                              fit: BoxFit.scaleDown,
                                child: Text(
                                  '\$${originalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontFamily:
                                        StoreTypographyFoundation.familyBody,
                                    fontSize:
                                        StoreTypographyFoundation.fontSizeBodyText,
                                    fontWeight:
                                        StoreTypographyFoundation.fontWeightRegular,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8.0),
                            if (discountPercentage != null &&
                                discountPercentage! > 0)
                              FittedBox(
                              fit: BoxFit.scaleDown,
                                child: Text(
                                  '$discountPercentage% off',
                                  style: const TextStyle(
                                    fontFamily:
                                        StoreTypographyFoundation.familyBody,
                                    fontSize:
                                        StoreTypographyFoundation.fontSizeBodyText,
                                    fontWeight:
                                        StoreTypographyFoundation.fontWeightBold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
