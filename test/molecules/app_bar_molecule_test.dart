import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group("appbar test ", () {
    testWidgets('renders with default title and no actions',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: AppBarMolecule(),
          ),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.actions, isNull);
      expect(appBar.title, isA<Text>());
      expect(appBar.backgroundColor, StoreColorsFoundation.backgroundColor);
      expect(appBar.iconTheme?.color, StoreColorsFoundation.textColor);
    });

    testWidgets('renders with custom title and actions',
        (WidgetTester tester) async {

      const customTitle = Text(
        'Custom Title',
        style: TextStyle(
          color: StoreColorsFoundation.textColor,
          fontSize: StoreTypographyFoundation.fontSizeH3,
        ),
      );
      final customActions = [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ];


      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBarMolecule(
              title: customTitle,
              actions: customActions,
            ),
          ),
        ),
      );


      expect(find.text('Custom Title'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.title, customTitle);
      expect(appBar.actions, customActions);
      expect(appBar.backgroundColor, StoreColorsFoundation.backgroundColor);
      expect(appBar.iconTheme?.color, StoreColorsFoundation.textColor);
    });

    testWidgets('checks the preferred size of AppBarMolecule',
        (WidgetTester tester) async {

      const appBar = AppBarMolecule();


      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: appBar,
          ),
        ),
      );


      expect(appBar.preferredSize, const Size.fromHeight(kToolbarHeight));
    });
  });
}
