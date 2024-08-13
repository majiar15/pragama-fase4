import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:flutter_models_commons/flutter_models_commons.dart';

void main() {
  group('CartTemplate Tests', () {
    late CartUIModel cart;

    setUp(() {
      cart = CartUIModel(
        products: [
          ProductCartUIModel(
              productId: 1,
              title: 'Producto 1',
              price: 10,
              image: 'example.jpg',
              quantity: 1),
          ProductCartUIModel(
              productId: 2,
              title: 'Producto 2',
              price: 20,
              image: 'example.jpg',
              quantity: 2)
        ],
      );
    });

    testWidgets('renders empty cart message when cart is empty',
        (WidgetTester tester) async {
      cart.products.clear();
      
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CartTemplate(
              cart: cart,
              onTapBuyNow: () {},
            ),
          ),
        );

        expect(find.text('¡Agrega Productos al carrito!'), findsOneWidget);
      });
    });

    testWidgets('renders products in the cart', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CartTemplate(
              cart: cart,
              onTapBuyNow: () {},
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(CardCartOrganism), findsNWidgets(2));
        expect(find.text('Producto 1'), findsOneWidget);
        expect(find.text('Producto 2'), findsOneWidget);
        expect(find.text('Total de la Compra: \$50.00'), findsOneWidget);
      });
    });

    testWidgets('increases and decreases product quantity correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CartTemplate(
              cart: cart,
              onTapBuyNow: () {},
            ),
          ),
        );

        await tester.tap(find.widgetWithIcon(IconButton, Icons.add).first);
        await tester.pump();

        expect(cart.products.first.quantity, 2);
        expect(find.text('Total de la Compra: \$60.00'), findsOneWidget);

        await tester.tap(find.widgetWithIcon(IconButton, Icons.remove).first);
        await tester.pump();

        expect(cart.products.first.quantity, 1);
        expect(find.text('Total de la Compra: \$50.00'), findsOneWidget);
      });
    });

    testWidgets('removes product from cart when quantity is decreased to zero',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CartTemplate(
              cart: cart,
              onTapBuyNow: () {},
            ),
          ),
        );

        await tester.tap(find.widgetWithIcon(IconButton, Icons.remove).first);
        await tester.pump();

        expect(cart.products.length, 1);
        expect(find.text('Producto 1'), findsNothing);
        expect(find.text('Total de la Compra: \$40.00'), findsOneWidget);
      });
    });

    testWidgets('calls onTapBuyNow callback when purchase button is pressed',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        var buyNowTapped = false;
        await tester.pumpWidget(
          MaterialApp(
            home: CartTemplate(
              cart: cart,
              onTapBuyNow: () {
                buyNowTapped = true;
              },
            ),
          ),
        );

        await tester.tap(find.text('Realizar Compra'));
        await tester.pump();

        expect(buyNowTapped, isTrue);
      });
    });
  });
}
