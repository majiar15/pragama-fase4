import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/foundations.dart';
import 'package:store_design_system/organisms/card_cart_organism.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart'
    show ProductCartUIModel;

void main() {
  group('CardCartOrganism', () {
    final product = ProductCartUIModel(
      productId: 1,
      title: 'Product 1',
      image: 'https://example.com/image.jpg',
      price: 29.99,
      quantity: 2,
    );
    testWidgets('displays product details correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CardCartOrganism(
                product: product,
                onIncrease: () {},
                onDecrease: () {},
              ),
            ),
          ),
        );
      });

      expect(find.byType(Image), findsOneWidget);
      final image = tester.widget<Image>(find.byType(Image));
      expect(image.image, NetworkImage(product.image));

      expect(find.text(product.title), findsOneWidget);

      expect(find.text('Precio: \$${product.price.toStringAsFixed(2)}'),
          findsOneWidget);

      // Verify quantity
      expect(find.text('${product.quantity}'), findsOneWidget);

      // Verify total price
      expect(
          find.text(
              'Total: \$${(product.price * product.quantity).toStringAsFixed(2)}'),
          findsOneWidget);
    });

    testWidgets('triggers onIncrease callback when increase button is pressed',
        (WidgetTester tester) async {
      bool increaseCalled = false;

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CardCartOrganism(
                product: product,
                onIncrease: () => increaseCalled = true,
                onDecrease: () {},
              ),
            ),
          ),
        );
      });

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(increaseCalled, isTrue);
    });

    testWidgets('triggers onDecrease callback when decrease button is pressed',
        (WidgetTester tester) async {
      bool decreaseCalled = false;

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CardCartOrganism(
                product: product,
                onIncrease: () {},
                onDecrease: () => decreaseCalled = true,
              ),
            ),
          ),
        );
      });

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();

      expect(decreaseCalled, isTrue);
    });
  });
}
