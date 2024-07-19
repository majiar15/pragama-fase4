import 'package:flutter/material.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart'
    show DiscountedProduct;
import 'package:store_design_system/store_design_system.dart';

class OfferTemplate extends StatefulWidget {
  final List<DiscountedProduct> productList;
  final List<DiscountedProduct> productsSimilar;

  final void Function(DiscountedProduct) onTapAddCart;
  final void Function(DiscountedProduct) onTapProductSimilar;

  const OfferTemplate({
    super.key,
    required this.productList,
    required this.productsSimilar,
    required this.onTapAddCart,
    required this.onTapProductSimilar,
  });

  @override
  OfferTemplateState createState() => OfferTemplateState();
}

class OfferTemplateState extends State<OfferTemplate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMolecule(
        title: Text(
          "OFERTAS",
          style: TextStyle(
            color: StoreColorsFoundation.textColor,
            fontSize: StoreTypographyFoundation.fontSizeH3,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
        child: GridView.builder(
              itemCount: widget.productList.length,
              itemBuilder: (ctx, i) {
                return CardOrganism(
                  imageUrl: widget.productList[i].image,
                  title: widget.productList[i].title,
                  description: widget.productList[i].description,
                  originalPrice: widget.productList[i].price,
                  rating: widget.productList[i].rating?.rate,
                  reviews: widget.productList[i].rating?.count,
                  discountPercentage: widget.productList[i]?.discountPercentage ?? 0,
                  onTapCard: () {
                    final productSimilarCategory = widget.productsSimilar
                        .where((element) =>
                            element.category == widget.productsSimilar[i].category)
                        .toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailTemplate(
                          onTapAddCart: widget.onTapAddCart,
                          onTapProductSimilar: widget.onTapProductSimilar,
                          discountPercentage: widget.productList[i]?.discountPercentage ?? 0,
                          product: widget.productList[i],
                          productList: productSimilarCategory,
                        ),
                      ),
                    );
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
      ),
    );
  }
}
