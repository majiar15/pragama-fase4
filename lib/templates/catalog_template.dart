import 'package:flutter/material.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart' show ProductModel, DiscountedProduct;
import 'package:store_design_system/store_design_system.dart';
class CatalogTemplate extends StatefulWidget {
  final List<DiscountedProduct> productList;
  final List<String> categories;

  final void Function(ProductModel) onTapAddCart;
  final void Function(ProductModel) onTapProductSimilar;
  final void Function(String query) onSearch;
  final void Function(String sortOption) onSortSelected;
  final void Function(String filterOption) onFilterProducts;

  const CatalogTemplate({
    super.key,
    required this.productList,
    required this.categories,
    required this.onTapAddCart,
    required this.onTapProductSimilar,
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

  // void _sortProducts(String sortOption) {
  //   setState(() {
  //     switch (sortOption) {
  //       case "title_asc":
  //         filteredList.sort((a, b) => a.title.compareTo(b.title));
  //         break;
  //       case "title_desc":
  //         filteredList.sort((a, b) => b.title.compareTo(a.title));
  //         break;
  //       case "price_asc":
  //         filteredList.sort((a, b) => a.price.compareTo(b.price));
  //         break;
  //       case "price_desc":
  //         filteredList.sort((a, b) => b.price.compareTo(a.price));
  //         break;
  //       case "reviews_asc":
  //         filteredList.sort((a, b) => a.rating?.rate?.compareTo(b.rating?.rate ?? 0) ?? 0);
  //         break;
  //       case "reviews_desc":
  //         filteredList.sort((a, b) => b.rating?.rate?.compareTo(a.rating?.rate ?? 0) ?? 0 );
  //         break;
  //     }
  //   });
  // }

  // void _performSearch(String query) {
  //   setState(() {
  //     filteredList = widget.productList
  //         .where((product) =>
  //             product.title.toLowerCase().contains(query.toLowerCase()) ||
  //             product.description.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  // void _filterProducts(String filterOption) {
  //   final bool isCategoryInclude = widget.categories.contains(filterOption);
  //   setState(() {
  //     if (isCategoryInclude) {
  //       filteredList = widget.productList
  //           .where((product) => product.category == filterOption)
  //           .toList();
  //     } else {
  //       filteredList = widget.productList;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
                  onSortSelected: widget.onSortSelected,
                  onFilterSelected: widget.onFilterProducts,
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
                    originalPrice: widget.productList[i].price,
                    rating: widget.productList[i].rating?.rate,
                    reviews: widget.productList[i].rating?.count,
                     onTapCard: () {
                        final productSimilar = widget.productList
                          .where(
                              (element) => element.category == widget.productList[i].category)
                          .toList();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailTemplate(
                              onTapAddCart: widget.onTapAddCart,
                              onTapProductSimilar: widget.onTapProductSimilar,
                              product: widget.productList[i],
                              productList: productSimilar,
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
          ],
        ),
      );
  }
}
