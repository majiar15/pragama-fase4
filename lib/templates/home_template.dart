import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/sizes_foundation.dart';
import 'package:store_desing_system/models/product_model.dart';
import 'package:store_desing_system/store_desing_system.dart';

class HomeTemplate extends StatelessWidget {
  final String name;
  final List<String> categories;
  final List<ProductModel> productList;
  void Function(String) onChangeUserText;
  void Function(String) onChangePasswordText;
  void Function() onTapTrendingProducts;
  void Function() onTapLogin;
  void Function() onTapSignUp;
  void Function(String) onTapCategory;

  HomeTemplate({
    super.key,
    this.name = "Martin",
    this.categories = const [
      "Camisas",
      "Pantalones",
      "Vestidos",
      'Faldas',
      'Hombre',
      'Mujer'
    ],
    required this.productList,
    required this.onTapTrendingProducts,
    required this.onTapLogin,
    required this.onTapSignUp,
    required this.onTapCategory,
    this.onChangeUserText = _defaultOnChange,
    this.onChangePasswordText = _defaultOnChange,
  });

  static void _defaultOnChange(String text) {}

  get getGreeting {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Buenos días';
    } else if (hour < 18) {
      return 'Buenas tardes';
    } else {
      return 'Buenas noches';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    List<ProductModel> firstPartLst = productList.sublist(0, 4);
    List<ProductModel> secondPartList = productList.sublist(4);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(StoreSizesFoundation.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$getGreeting, $name",
              style: const TextStyle(
                fontSize: StoreTypographyFoundation.fontSizeH4,
                fontWeight: StoreTypographyFoundation.fontWeightBold,
              ),
            ),
            const SizedBox(
              height: StoreSpacingFoundation.sl,
            ),
            const Text(
              'Explora Nuestros productos relevantes',
              style: TextStyle(
                fontSize: StoreTypographyFoundation.fontSizeH5,
                fontWeight: StoreTypographyFoundation.fontWeightMedium,
              ),
            ),
            const SizedBox(
              height: StoreSpacingFoundation.sl,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: firstPartLst.length,
              itemBuilder: (ctx, i) {
                return CardOrganism(
                  imageUrl: firstPartLst[i].image,
                  title: firstPartLst[i].title,
                  description: firstPartLst[i].description,
                  originalPrice: firstPartLst[i].price,
                  rating: firstPartLst[i].rating.rate,
                  reviews: firstPartLst[i].rating.count,
                  onTapCard: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailPage(),
                      settings: RouteSettings(arguments: firstPartLst[i]),
                    ),
                  ),
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
            const SizedBox(
              height: StoreSpacingFoundation.lg,
            ),
            BannerTrendingProductsMolecule(
              date: "15/05/2024",
              onTapButon: onTapTrendingProducts,
            ),
            const SizedBox(
              height: StoreSpacingFoundation.lg,
            ),
            SizedBox(
              width: screenSize.width,
              height: 240,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.1,
                ),
                itemCount: productList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  return CardSmallOrganism(
                    imageUrl: productList[i].image,
                    title: productList[i].title,
                    description: productList[i].description,
                    originalPrice: productList[i].price,
                    onTapCard: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductDetailPage(),
                        settings: RouteSettings(arguments: productList[i]),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: StoreSpacingFoundation.lg,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (ctx, i) {
                return CardOrganism(
                  imageUrl: secondPartList[i].image,
                  title: secondPartList[i].title,
                  description: secondPartList[i].description,
                  originalPrice: secondPartList[i].price,
                  rating: secondPartList[i].rating.rate,
                  reviews: secondPartList[i].rating.count,
                  onTapCard: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailPage(),
                      settings: RouteSettings(arguments: secondPartList[i]),
                    ),
                  ),
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
    );
  }
}