import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/pages/home_page.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group("home Page", () {
    testWidgets('HomePage renders correctly', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));

        expect(find.byType(AppBarMolecule), findsOneWidget);
        expect(find.byType(IndexedStack), findsOneWidget);
        expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
        expect(find.byIcon(Icons.menu), findsOneWidget);
      });
    });

    testWidgets('Navigation ', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));

        expect(find.byType(HomeTemplate), findsOneWidget);
        expect(find.byIcon(Icons.menu), findsOneWidget);

      });
    });

    testWidgets('Drawer opens and closes', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));

        expect(find.byType(DrawerOrganism), findsNothing);

        await tester.tap(find.byIcon(Icons.menu));
        await tester.pumpAndSettle();

        expect(find.byType(DrawerOrganism), findsOneWidget);
        expect(find.byType(DrawerItemMolecule).last, findsOneWidget);

        await tester.tap(find.byType(DrawerItemMolecule).last);
      });
    });
  });
}
