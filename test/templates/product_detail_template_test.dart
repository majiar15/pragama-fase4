import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart';

void main() {
  testWidgets(
      'ProductDetailTemplate renders correctly and handles interactions',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      final DiscountedProduct sampleProduct = DiscountedProduct(
        id: 1,
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 109.95,
        discountPercentage: 15,
        description:
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        category: "men's clothing",
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        rating: Rating(rate: 3.9, count: 120),
      );

      final List<DiscountedProduct> similarProducts = [
        DiscountedProduct(
          id: 2,
          title: "Mens Casual Premium Slim Fit T-Shirts",
          price: 22.3,
          discountPercentage: 10,
          description:
              "Slim-fitting style, contrast raglan long sleeve, three-button henley placket.",
          category: "men's clothing",
          image: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UL1500_.jpg",
          rating: Rating(rate: 4.1, count: 259),
        ),
      ];

      bool addToCartTapped = false;
      bool similarProductTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: ProductDetailTemplate(
            product: sampleProduct,
            productList: similarProducts,
            onTapAddCart: (product) {
              addToCartTapped = true;
            },
            onTapSimilarProduct: (product) {
              similarProductTapped = true;
            },
          ),
        ),
      );

      expect(find.text(sampleProduct.title), findsOneWidget);

      expect(find.text(sampleProduct.description), findsOneWidget);


      expect(find.text('${sampleProduct.discountPercentage}% off'),
          findsOneWidget);

      await tester.ensureVisible(find.byType(ButtonAtom));
      await tester.tap(find.byType(ButtonAtom));
      await tester.pumpAndSettle();
      expect(addToCartTapped, isTrue);

    });
  });
}
