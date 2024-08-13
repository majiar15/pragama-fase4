import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/pages/cart_page.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/templates/cart_template.dart';

void main() {
  testWidgets('CartPage displays cart items and Buy Now button works',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(find.byType(CartTemplate), findsOneWidget);

      expect(
          find.text("Mens Casual Premium Slim Fit T-Shirts "), findsOneWidget);
      expect(find.text("Mens C2 "), findsOneWidget);
      expect(find.text("Mensq  "), findsNWidgets(2));

      expect(find.byType(ButtonAtom), findsOneWidget);

      await tester.tap(find.byType(ButtonAtom));
      await tester.pump();
    });
  });
}
