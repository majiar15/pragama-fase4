import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group('ForgotPasswordTemplate Tests', () {
    late TextEditingController emailController;

    setUp(() {
      emailController = TextEditingController();
    });

    testWidgets('renders input field and button', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ForgotPasswordTemplate(
              emailController: emailController,
              onSubmit: () {},
              onChangeEmailText: (text) {},
            ),
          ),
        );

        expect(find.byType(InputAtom), findsOneWidget);
        expect(find.byType(ButtonAtom), findsOneWidget);
        expect(find.text('¿Olvidó su'), findsOneWidget);
        expect(find.text('contraseña?'), findsOneWidget);
        expect(find.text('Ingrese su Email'), findsOneWidget);
        expect(find.text('Enviar'), findsOneWidget);
      });
    });

    testWidgets('validates email input and calls onSubmit',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        bool submitCalled = false;
        await tester.pumpWidget(
          MaterialApp(
            home: ForgotPasswordTemplate(
              emailController: emailController,
              onSubmit: () {
                submitCalled = true;
              },
              onChangeEmailText: (text) {},
            ),
          ),
        );

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(submitCalled, false);

        emailController.text = 'test@example.com';
        await tester.pump();

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(submitCalled, true);
      });
    });

    testWidgets('shows validation error messages for invalid email',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ForgotPasswordTemplate(
              emailController: emailController,
              onSubmit: () {},
              onChangeEmailText: (text) {},
            ),
          ),
        );

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(find.text('Por favor ingrese su correo electrónico'),
            findsOneWidget);

        emailController.text = 'invalid-email';
        await tester.pump();

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(find.text('Por favor ingrese un correo electrónico válido'),
            findsOneWidget);
      });
    });
  });
}
