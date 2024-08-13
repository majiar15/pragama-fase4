import 'package:flutter/material.dart';
import 'package:flutter_models_commons/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart'
    show DiscountedProduct;

void main() {
  group('HomeTemplate Tests', () {
    late List<DiscountedProduct> mockProducts;

    setUp(() {
      mockProducts = List.generate(
          10,
          (index) => DiscountedProduct(
                image: 'https://example.com/image$index.jpg',
                title: 'Product $index',
                description: 'Description $index',
                price: 100.0 + index * 10,
                discountPercentage: index % 2 == 0 ? 10 : 20,
                rating: Rating(rate: 4.5, count: 100),
                category: 'Category $index',
              ));
    });

    testWidgets('renders greeting and product grids',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: HomeTemplate(
                productList: mockProducts,
                onTapTrendingProducts: () {},
                onTapCard: (_) {},
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.text('Buenas tardes, Martin'), findsOneWidget);
        expect(
            find.text('Explora Nuestros productos relevantes'), findsOneWidget);

        expect(find.byType(CardOrganism), findsNWidgets(8));
        expect(find.byType(BannerTrendingProductsMolecule), findsOneWidget);
        expect(find.byType(CardSmallOrganism), findsNWidgets(4));
      });
    });

    testWidgets('calls onTapCard when a card is tapped',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        bool cardTapped = false;
        final tappedProduct = mockProducts[0];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: HomeTemplate(
                productList: mockProducts,
                onTapTrendingProducts: () {},
                onTapCard: (product) {
                  if (product == tappedProduct) {
                    cardTapped = true;
                  }
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byType(CardOrganism).first);
        await tester.pump();

        expect(cardTapped, true);
      });
    });

    testWidgets('calls onTapTrendingProducts when banner is tapped',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
      bool trendingTapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: HomeTemplate(
                productList: mockProducts,
                onTapTrendingProducts: () {
                  print("object");
                  trendingTapped = true;
                },
                onTapCard: (_) {},
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.text('View all'));

        await tester.tap(find.text('View all'));
        await tester.pumpAndSettle();

        expect(trendingTapped, true);
      });
    });
  });
}
