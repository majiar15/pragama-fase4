import 'package:flutter/material.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart'
    show  DiscountedProduct;

class ProductDetailTemplate extends StatelessWidget {
  final DiscountedProduct product;
  final List<DiscountedProduct> productList;
  final void Function(DiscountedProduct product) onTapAddCart;
  final void Function(DiscountedProduct product) onTapSimilarProduct;
  final AppBarMolecule appBar;
  final double originalPrice;

  const ProductDetailTemplate(
      {super.key,
      required this.product,
      required this.productList,
      required this.onTapAddCart,
      required this.onTapSimilarProduct,
      this.originalPrice = 3000,
      this.appBar =  const AppBarMolecule(
          title: Text(
            'Detalle de producto',
            style: TextStyle(
                color: StoreColorsFoundation.textColor,
                fontWeight: StoreTypographyFoundation.fontWeightBold),
          ),
        ),});

  double get discountedPrice {
    if (product.discountPercentage > 0 &&
        product.discountPercentage <= 100) {
      return (product.price * (1 - product.discountPercentage / 100));
    }
    return product.price;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    List<DiscountedProduct> productSimilar = productList.length >= 4 ? productList.sublist(0, 4) : [];
    final double buttonsWidths = screenSize.width * 0.4;
    return Scaffold(
      appBar: appBar,
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
                      rating: product.rating.rate,
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '${product.rating.count}',
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
                  if (product.discountPercentage > 0)
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
                  if (product.discountPercentage > 0)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${product.discountPercentage}% off',
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
                    onPressed: () => {onTapAddCart(
                      product.copyWith(price: discountedPrice)
                    )},
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
                    discountPercentage: productSimilar[i].discountPercentage,
                    rating: productSimilar[i].rating.rate,
                    reviews: productSimilar[i].rating.count,
                    onTapCard: ()=>{
                      onTapSimilarProduct(productSimilar[i])
                    }
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 440,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
