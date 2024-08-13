import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart';

void main() {
  group('CatalogTemplate Tests', () {
    late List<DiscountedProduct> productList;
    late List<String> categories;

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
          rating: Rating(rate: 4.0, count: 50),
          image: 'https://via.placeholder.com/150',
          category: 'Category 2',
        ),
      ];

      categories = ['Category 1', 'Category 2', 'Category 3'];
    });

    testWidgets('renders search input and product list',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(

              body: CatalogTemplate(
                productList: productList,
                categories: categories,
                onTapCard: (product) {},
                onSearch: (query) {},
                onSortSelected: (sortOption) {},
                onFilterProducts: (filterOption) {},
              ),
            ),
          ),
        );

        expect(find.byType(InputAtom), findsOneWidget);
        expect(find.byType(GridView), findsOneWidget);
        expect(find.byType(CardOrganism), findsNWidgets(2));
        expect(find.text('Product 1'), findsOneWidget);
        expect(find.text('Product 2'), findsOneWidget);
      });
    });

    testWidgets('calls onTapCard when a product card is tapped',
        (WidgetTester tester) async {
      ProductModel? tappedProduct;
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CatalogTemplate(
                productList: productList,
                categories: categories,
                onTapCard: (product) {
                  tappedProduct = product;
                },
                onSearch: (query) {},
                onSortSelected: (sortOption) {},
                onFilterProducts: (filterOption) {},
              ),
            ),
          ),
        );

        await tester.tap(find.text('Product 1'));
        await tester.pump();

        expect(tappedProduct, isNotNull);
        expect(tappedProduct?.id, productList[0].id);
      });
    });

    testWidgets('calls onSearch when text is entered in search input',
        (WidgetTester tester) async {
      String? searchedQuery;
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CatalogTemplate(
                productList: productList,
                categories: categories,
                onTapCard: (product) {},
                onSearch: (query) {
                  searchedQuery = query;
                },
                onSortSelected: (sortOption) {},
                onFilterProducts: (filterOption) {},
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(InputAtom), 'Product');
        await tester.pump();

        expect(searchedQuery, 'Product');
      });
    });

  });
}
