import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group('OfferTemplate Tests', () {
    late List<DiscountedProduct> productList;
    late List<DiscountedProduct> productsSimilar;

    setUp(() {
      productList = [
        DiscountedProduct(
          id: 1,
          title: 'Product 1',
          description: 'Description 1',
          price: 100.0,
          discountPercentage: 10,
          rating: Rating(rate: 4.5, count: 100),
          image: 'https://via.placeholder.com/150',
          category: 'Category 1',
        ),
        DiscountedProduct(
          id: 2,
          title: 'Product 2',
          description: 'Description 2',
          price: 200.0,
          discountPercentage: 20,
          rating: Rating(rate: 4.0, count: 200),
          image: 'https://via.placeholder.com/150',
          category: 'Category 2',
        ),
      ];

      productsSimilar = [];
    });

    testWidgets('renders all products correctly in the grid',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: OfferTemplate(
              productList: productList,
              productsSimilar: productsSimilar,
              onTapAddCart: (_) {},
              onTapCard: (_) {},
            ),
          ),
        );

        expect(find.text('Product 1'), findsOneWidget);
        expect(find.text('Product 2'), findsOneWidget);
        expect(find.text('Description 1'), findsOneWidget);
        expect(find.text('Description 2'), findsOneWidget);
      });
    });

    testWidgets('calls onTapCard callback when a product card is tapped',
        (WidgetTester tester) async {
      late DiscountedProduct tappedProduct;
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: OfferTemplate(
              productList: productList,
              productsSimilar: productsSimilar,
              onTapAddCart: (_) {},
              onTapCard: (product) {
                tappedProduct = product;
              },
            ),
          ),
        );

        await tester.tap(find.text('Product 1'));
        await tester.pump();

        expect(tappedProduct, equals(productList.first));
      });
    });
  });
}
