import 'package:flutter/material.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart' show ProductModel, DiscountedProduct;
import 'package:store_design_system/store_design_system.dart';
class CatalogTemplate extends StatefulWidget {
  final List<DiscountedProduct> productList;
  final List<String> categories;

  final void Function(ProductModel) onTapCard;
  final void Function(String query) onSearch;
  final void Function(String sortOption) onSortSelected;
  final void Function(String filterOption) onFilterProducts;

  const CatalogTemplate({
    super.key,
    required this.productList,
    required this.categories,
    required this.onTapCard,
    required this.onSearch,
    required this.onSortSelected,
    required this.onFilterProducts,

  });

  @override
  _CatalogTemplateState createState() => _CatalogTemplateState();
}

class _CatalogTemplateState extends State<CatalogTemplate> {

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputAtom(
              label: 'Search',
              controller: _searchController,
              onChanged: widget.onSearch,
              iconData: Icons.search,
              isPassword: false,
            ),
            const SizedBox(
              height: StoreSpacingFoundation.md,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: "${widget.productList.length} ",
                      style: const TextStyle(
                        fontSize: StoreTypographyFoundation.fontSizeUpSmall,
                        fontWeight: StoreTypographyFoundation.fontWeightBold,
                        color: StoreColorsFoundation.primaryColor,
                      ),
                      children: const [
                        TextSpan(
                          text: "Productos",
                          style: TextStyle(
                            fontWeight: StoreTypographyFoundation.fontWeightMedium,
                            color: StoreColorsFoundation.textColor,
                          ),
                        )
                      ]),
                ),
                FilterSortOrganism(
                  filterCategories: [...widget.categories, "All"],
                  onSortSelected: (sort){
                    widget.onSortSelected(sort);
                  },
                  onFilterSelected: (filter){
                    widget.onFilterProducts(filter);
                  },
                )
              ],
            ),
            const SizedBox(
              height: StoreSpacingFoundation.md,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: widget.productList.length,
                itemBuilder: (ctx, i) {
                  return CardOrganism(
                    imageUrl: widget.productList[i].image,
                    title: widget.productList[i].title,
                    description: widget.productList[i].description,
                    discountPercentage: widget.productList[i].discountPercentage,
                    originalPrice: widget.productList[i].price,
                    rating: widget.productList[i].rating.rate,
                    reviews: widget.productList[i].rating.count,
                    onTapCard: () => widget.onTapCard(widget.productList[i]),

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
            ),
          ],
        ),
      );
  }
}
