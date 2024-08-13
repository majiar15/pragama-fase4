import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  testWidgets('DrawerItemMolecule displays the correct icon and label, and triggers onTap', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DrawerItemMolecule(
            label: 'Test Item',
            icon: Icons.home,
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.text('Test Item'), findsOneWidget);

    await tester.tap(find.byType(ListTile));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
