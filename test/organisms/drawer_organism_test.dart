import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group('DrawerOrganism', () {
    testWidgets('displays drawer items and information correctly',
        (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      final drawerItems = [
        DrawerItemMolecule(
          label: 'Item 1',
          icon: Icons.home,
          onTap: () {},
        ),
        DrawerItemMolecule(
          label: 'Item 2',
          icon: Icons.settings,
          onTap: () {},
        ),
      ];

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(),
              drawer: SizedBox(
                width: 500,
                height: 800,
                child: DrawerOrganism(
                  items: drawerItems,
                  name: 'User Name',
                  onClose: () {},
                  onTapLogout: () {},
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle(const Duration(seconds: 1));
        scaffoldKey.currentState?.openDrawer();
        await tester.pump();

        expect(find.byType(DrawerHeaderMolecule), findsOneWidget);
        expect(find.text('User Name'), findsOneWidget);

        for (final item in drawerItems) {
          expect(find.text(item.label), findsOneWidget);
          expect(find.byIcon(item.icon), findsOneWidget);
        }

        expect(find.text('Cerrar session'), findsOneWidget);
        expect(find.byIcon(Icons.logout), findsOneWidget);

        expect(find.text('Power by pragma'), findsOneWidget);
        expect(find.text('V 1.0.0'), findsOneWidget);
      });
    });

    testWidgets('triggers onTapLogout callbacks correctly',
        (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      bool loggedOut = false;

      final drawerItems = [
        DrawerItemMolecule(
          label: 'Item 1',
          icon: Icons.home,
          onTap: () {},
        ),
      ];
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(),
              drawer: DrawerOrganism(
                items: drawerItems,
                name: 'User Name',
                onClose: () => {},
                onTapLogout: () => {print("tap tap"),loggedOut = true},
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Cerrar session'));
        await tester.pumpAndSettle();
        expect(loggedOut, isTrue);
      });
    });
  });
}
