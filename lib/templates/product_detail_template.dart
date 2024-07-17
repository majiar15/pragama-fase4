import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart'
    show ProductModel, Rating;

class ProductDetailTemplate extends StatelessWidget {
  final ProductModel product;
  final List<ProductModel> productList;
  final void Function(ProductModel) onTapAddCart;
  final void Function(ProductModel) onTapProductSimilar;

  final double originalPrice;
  final int? discountPercentage;

  const ProductDetailTemplate(
      {super.key,
      required this.product,
      required this.productList,
      required this.onTapAddCart,
      required this.onTapProductSimilar,
      this.originalPrice = 3000,
      this.discountPercentage = 20});

  double get discountedPrice {
    if (discountPercentage != null &&
        discountPercentage! > 0 &&
        discountPercentage! <= 100) {
      return (product.price * (1 - discountPercentage! / 100));
    }
    return product.price;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    List<ProductModel> productSimilar = productList.sublist(0, 4);
    final double buttonsWidths = screenSize.width * 0.4;
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarBarMolecule(
          title: Text(
            'Detalle de producto',
            style: TextStyle(
                color: StoreColorsFoundation.textColor,
                fontWeight: StoreTypographyFoundation.fontWeightBold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 450,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(StoreSizesFoundation.borderRadiusL)),
                      child: ImageAtom(
                        src: product.image,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: StoreSpacingFoundation.lg,
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: StoreTypographyFoundation.fontSizeH3,
                      fontWeight: StoreTypographyFoundation.fontWeightBold,
                      color: StoreColorsFoundation.textColor),
                ),
                const SizedBox(
                  height: StoreSpacingFoundation.md,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: ListStarMolecule(
                        backgroundActiveColor: StoreColorsFoundation.goldColor,
                        backgroundDisableColor: StoreColorsFoundation.textHint,
                        items: 5,
                        rating: product.rating?.rate,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '${product.rating?.count}',
                      style: const TextStyle(
                        fontFamily: StoreTypographyFoundation.familyBody,
                        fontSize: StoreTypographyFoundation.fontSizeH5,
                        fontWeight: StoreTypographyFoundation.fontWeightRegular,
                        color: StoreColorsFoundation.textHint,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: StoreSpacingFoundation.s,
                ),
                Row(
                  children: [
                    Text(
                      '\$${discountedPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: StoreTypographyFoundation.familyBody,
                        fontSize: StoreTypographyFoundation.fontSizeH4,
                        fontWeight: StoreTypographyFoundation.fontWeightBold,
                      ),
                    ),
                    const SizedBox(
                      width: StoreSpacingFoundation.s,
                    ),
                    if (discountPercentage != null && discountPercentage! > 0)
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '\$${originalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: StoreTypographyFoundation.familyBody,
                            fontSize: StoreTypographyFoundation.fontSizeH5,
                            fontWeight:
                                StoreTypographyFoundation.fontWeightRegular,
                            color: StoreColorsFoundation.textHint,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: StoreSpacingFoundation.s,
                    ),
                    if (discountPercentage != null && discountPercentage! > 0)
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '$discountPercentage% off',
                          style: const TextStyle(
                            fontFamily: StoreTypographyFoundation.familyBody,
                            fontSize: StoreTypographyFoundation.fontSizeH5,
                            fontWeight:
                                StoreTypographyFoundation.fontWeightBold,
                            color: StoreColorsFoundation.primaryColor,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: StoreSpacingFoundation.md,
                ),
                const Text(
                  "Detalles del producto",
                  style: TextStyle(
                      fontSize: StoreTypographyFoundation.fontSizeH4,
                      fontWeight: StoreTypographyFoundation.fontWeightMedium,
                      color: StoreColorsFoundation.textColor),
                ),
                const SizedBox(
                  height: StoreSpacingFoundation.md,
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontFamily: StoreTypographyFoundation.familyBody,
                    fontSize: StoreTypographyFoundation.fontSizeH5,
                    fontWeight: StoreTypographyFoundation.fontWeightMedium,
                    color: StoreColorsFoundation.textHint,
                  ),
                ),
                const SizedBox(
                  height: StoreSpacingFoundation.md,
                ),
                Row(
                  children: [
                    ButtonAtom(
                      label: 'añadir al carrito',
                      onPressed: () => {onTapAddCart(product)},
                      backgroundColor: StoreColorsFoundation.primaryColor,
                      size: Size(buttonsWidths, 50),
                    ),
                  ],
                ),
                const SizedBox(
                  height: StoreSpacingFoundation.md,
                ),
                const Text(
                  "Productos Similares",
                  style: TextStyle(
                    fontSize: StoreTypographyFoundation.fontSizeH3,
                    fontWeight: StoreTypographyFoundation.fontWeightBold,
                  ),
                ),
                const SizedBox(
                  height: StoreSpacingFoundation.md,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: productSimilar.length,
                  itemBuilder: (ctx, i) {
                    return CardOrganism(
                      imageUrl: productSimilar[i].image,
                      title: productSimilar[i].title,
                      description: productSimilar[i].description,
                      originalPrice: productSimilar[i].price,
                      rating: productSimilar[i].rating?.rate,
                      reviews: productSimilar[i].rating?.count,
                      onTapCard: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailTemplate(
                              onTapAddCart: onTapAddCart,
                              onTapProductSimilar: onTapProductSimilar,
                              product: productSimilar[i],
                              productList: productSimilar,
                            ),
                          ),
                        )
                      },
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 370,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
