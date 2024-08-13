import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/tokens/spacing_token.dart';

void main() {
  group("drawer test ", () {
    testWidgets('renders avatar and username correctly',
        (WidgetTester tester) async {
      const testImageUrl = 'https://example.com/avatar.jpg';
      const testUsername = 'John Doe';
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DrawerHeaderMolecule(
                imageUrl: testImageUrl,
                username: testUsername,
              ),
            ),
          ),
        );
      });

      final avatarFinder = find.byType(AvatarAtom);
      expect(avatarFinder, findsOneWidget);

      final avatarWidget = tester.widget<AvatarAtom>(avatarFinder);
      expect(avatarWidget.imageUrl, testImageUrl);
      expect(avatarWidget.size, 100);

      expect(find.text(testUsername), findsOneWidget);

      final usernameTextStyle =
          tester.widget<Text>(find.text(testUsername)).style;
      expect(usernameTextStyle?.fontSize, StoreTypographyFoundation.fontSizeH4);
      expect(usernameTextStyle?.fontWeight, FontWeight.bold);
    });

    testWidgets('applies correct padding and spacing',
        (WidgetTester tester) async {
      const testImageUrl = 'https://example.com/avatar.jpg';
      const testUsername = 'John Doe';
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DrawerHeaderMolecule(
                imageUrl: testImageUrl,
                username: testUsername,
              ),
            ),
          ),
        );
      });

      final paddingFinder = find.byType(Padding);
      expect(paddingFinder.first, findsOneWidget);

      final sizedBoxFinder = find.byType(SizedBox);
      expect(sizedBoxFinder, findsOneWidget);

      final sizedBoxWidget = tester.widget<SizedBox>(sizedBoxFinder);
      expect(sizedBoxWidget.height, StoreSpacingToken.spaceSL);
    });
  });
}
