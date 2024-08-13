import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group("Image Atom", () {

    testWidgets('ImageAtom displays error message on image load failure',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ImageAtom(
                src: 'https://example.com/invalid_image.jpg',
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byWidget(const ImageAtom(src: 'https://example.com/invalid_image.jpg',)), findsNothing);
      });
    });

    testWidgets('ImageAtom displays image correctly when loaded',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ImageAtom(
                src: 'https://example.com/image.jpg',
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(Image), findsOneWidget);
      });
    });
  });
}
