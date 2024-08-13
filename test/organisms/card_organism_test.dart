import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/organisms/card_organism.dart';
import 'package:store_design_system/atoms/image_atom.dart';
import 'package:store_design_system/molecules/list_star_molecule.dart';

void main() {
  const imageUrl = 'https://example.com/image.jpg';
  const title = 'Product Title';
  const description = 'Product Description';
  const originalPrice = 100.00;
  const discountPercentage = 20;
  const rating = 4.5;
  const reviews = 10;

  group('CardOrganism', () {
    testWidgets('displays product details correctly',
        (WidgetTester tester) async {

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 300,
                height: 400,
                child: CardOrganism(
                  imageUrl: imageUrl,
                  title: title,
                  description: description,
                  originalPrice: originalPrice,
                  discountPercentage: discountPercentage,
                  rating: rating,
                  reviews: reviews,
                  onTapCard: () {},
                ),
              ),
            ),
          ),
        );
      });
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(ImageAtom), findsOneWidget);
      final image = tester.widget<ImageAtom>(find.byType(ImageAtom));
      expect(image.src, imageUrl);

      expect(find.text(title), findsOneWidget);

      expect(find.text(description), findsOneWidget);

      const discountedPrice = originalPrice * (1 - discountPercentage / 100);
      expect(
          find.text('\$${discountedPrice.toStringAsFixed(2)}'), findsOneWidget);

      expect(
          find.text('\$${originalPrice.toStringAsFixed(2)}'), findsOneWidget);

      expect(find.text('${discountPercentage}% off'), findsOneWidget);

      expect(find.byType(ListStarMolecule), findsOneWidget);
      final stars =
          tester.widget<ListStarMolecule>(find.byType(ListStarMolecule));
      expect(stars.rating, rating);

      expect(find.text('$reviews'), findsOneWidget);
    });

    testWidgets('triggers onTapCard callback when the card is tapped',
        (WidgetTester tester) async {
      bool cardTapped = false;

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 300,
                height: 400,
                child: CardOrganism(
                  imageUrl: imageUrl,
                  title: title,
                  description: description,
                  originalPrice: originalPrice,
                  discountPercentage: discountPercentage,
                  rating: rating,
                  reviews: reviews,
                  onTapCard: () => cardTapped = true,
                ),
              ),
            ),
          ),
        );
      });

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(cardTapped, isTrue);
    });
  });
}
