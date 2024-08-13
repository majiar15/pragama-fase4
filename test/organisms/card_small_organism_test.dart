import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/organisms/card_small_organism.dart';
import 'package:store_design_system/atoms/image_atom.dart';

void main() {
  group('CardSmallOrganism', () {
    const imageUrl = 'https://example.com/image.jpg';
    const title = 'Product Title';
    const description = 'Product Description';
    const originalPrice = 100.00;
    const discountPercentage = 20;
    testWidgets('displays product details correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 300,
                height: 400,
                child: CardSmallOrganism(
                  imageUrl: imageUrl,
                  title: title,
                  description: description,
                  originalPrice: originalPrice,
                  discountPercentage: discountPercentage,
                  onTapCard: () {},
                ),
              ),
            ),
          ),
        );
      });

      expect(find.byType(ImageAtom), findsOneWidget);
      final image = tester.widget<ImageAtom>(find.byType(ImageAtom));
      expect(image.src, imageUrl);

      expect(find.text(title), findsOneWidget);

      expect(find.text(description), findsOneWidget);

      final discountedPrice = originalPrice * (1 - discountPercentage / 100);
      expect(
          find.text('\$${discountedPrice.toStringAsFixed(2)}'), findsOneWidget);

      expect(
          find.text('\$${originalPrice.toStringAsFixed(2)}'), findsOneWidget);

      expect(find.text('$discountPercentage% off'), findsOneWidget);
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
                child: CardSmallOrganism(
                  imageUrl: imageUrl,
                  title: title,
                  description: description,
                  originalPrice: originalPrice,
                  discountPercentage: discountPercentage,
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
