import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/pages/catalog_page.dart';
import 'package:store_design_system/store_design_system.dart';


void main() {
  testWidgets(
      'CatalogPage displays products, and searching',
      (WidgetTester tester) async {
    
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CatalogPage()),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(CatalogTemplate), findsOneWidget);


      expect(find.text("Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"),
          findsOneWidget);
      expect(
          find.text("Mens Casual Premium Slim Fit T-Shirts "), findsOneWidget);
      expect(find.text("Mens Cotton Jacket"), findsOneWidget);
      expect(find.text("Mens Casual Slim Fit"), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'me');
      await tester.pumpAndSettle();
      expect(find.text("Mens Cotton Jacket"), findsOneWidget);
      expect(find.text("Mens Casual Slim Fit"), findsOneWidget);
      expect(
          find.text("WD 2TB Elements Portable External Hard Drive - USB 3.0 "),
          findsNothing);
      await tester.enterText(find.byType(TextField), '');
      await tester.pumpAndSettle();

      
      await tester.tap(find.byType(FilterButtonAtom));
      await tester.pumpAndSettle();

    });
  });
      testWidgets('renders search input and product list',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: CatalogPage()),
          ),
        );

        expect(find.byType(InputAtom), findsOneWidget);
        expect(find.byType(GridView), findsOneWidget);
        expect(find.byType(CardOrganism), findsNWidgets(4));
        expect(find.text('Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops'), findsOneWidget);
        expect(find.text('Mens Casual Premium Slim Fit T-Shirts '), findsOneWidget);
      });
    });
}
