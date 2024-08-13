import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  testWidgets('AvatarAtom displays network image correctly', (WidgetTester tester) async {
    const testImageUrl = 'https://example.com/test-image.png';
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AvatarAtom(
              imageUrl: testImageUrl,
              size: 80.0,
            ),
          ),
        ),
      );

      final circleAvatarFinder = find.byType(CircleAvatar);

      expect(circleAvatarFinder, findsOneWidget);

      final CircleAvatar circleAvatar = tester.widget(circleAvatarFinder) as CircleAvatar;
      expect(circleAvatar.radius, 80.0 / 2);

      final backgroundImage = circleAvatar.backgroundImage;
      expect(backgroundImage, isA<NetworkImage>());
      expect((backgroundImage as NetworkImage).url, testImageUrl);
    });
  });
}
