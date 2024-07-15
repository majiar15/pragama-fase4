import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/colors_foundation.dart';
import 'package:store_desing_system/foundation/sizes_foundation.dart';
import 'package:store_desing_system/foundation/typography_foundation.dart';
import 'package:store_desing_system/store_desing_system.dart';

class CardOrganism extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double originalPrice;
  final int? discountPercentage;
  final double rating;
  final int reviews;
  void Function() onTapCard;

  CardOrganism({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.originalPrice,
    this.discountPercentage,
    required this.rating,
    required this.reviews,
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
        height: 350,
        width: 250,
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
              width: 250,
              height: 300,
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
                        Text(
                          title,
                          style: const TextStyle(
                            fontFamily: StoreTypographyFoundation.familyHeadings,
                            fontSize: StoreTypographyFoundation.fontSizeH4,
                            fontWeight: StoreTypographyFoundation.fontWeightBold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: StoreSizesFoundation.paddingS),
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: StoreTypographyFoundation.familyBody,
                            fontSize: StoreTypographyFoundation.fontSizeBodyText,
                            fontWeight:
                                StoreTypographyFoundation.fontWeightRegular,
                            color: StoreColorsFoundation.textHint,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '\$${discountedPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontFamily: StoreTypographyFoundation.familyBody,
                                  fontSize: StoreTypographyFoundation.fontSizeH4,
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
                                    fontSize: StoreTypographyFoundation.fontSizeH5,
                                    fontWeight:
                                        StoreTypographyFoundation.fontWeightRegular,
                                    color: StoreColorsFoundation.textHint,
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
                                    fontSize: StoreTypographyFoundation.fontSizeH5,
                                    fontWeight:
                                        StoreTypographyFoundation.fontWeightBold,
                                    color: StoreColorsFoundation.primaryColor,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: ListStarMolecule(
                                backgroundActiveColor:
                                    StoreColorsFoundation.goldColor,
                                backgroundDisableColor:
                                    StoreColorsFoundation.textHint,
                                items: 5,
                                rating: rating,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              reviews.toString(),
                              style: const TextStyle(
                                fontFamily: StoreTypographyFoundation.familyBody,
                                fontSize:
                                    StoreTypographyFoundation.fontSizeBodyText,
                                fontWeight:
                                    StoreTypographyFoundation.fontWeightRegular,
                                color: StoreColorsFoundation.textHint,
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
