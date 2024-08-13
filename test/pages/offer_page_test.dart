import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/pages/offer_page.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  testWidgets('OfferPage displays product list and handles taps',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp(home: OfferPage()));

      expect(find.byType(CardOrganism), findsNWidgets(4));

      expect(find.text("Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"),
          findsOneWidget);

      await tester.tap(find.byType(CardOrganism).first);
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  });
}
