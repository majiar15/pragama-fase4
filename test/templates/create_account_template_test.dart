import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_design_system/store_design_system.dart';
void main() {
  group('CreateAccountTemplate Tests', () {
    late TextEditingController userController;
    late TextEditingController passwordController;
    late TextEditingController confirmPasswordController;

    setUp(() {
      userController = TextEditingController();
      passwordController = TextEditingController();
      confirmPasswordController = TextEditingController();
    });

    testWidgets('renders input fields and buttons',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CreateAccountTemplate(
              userController: userController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              onChangeUserText: (text) {},
              onChangePasswordText: (text) {},
              onChangeConfirmPasswordText: (text) {},
              onTapCreateAccount: () {},
              onTapLoginLink: () {},
            ),
          ),
        );

        expect(find.byType(InputAtom), findsNWidgets(3));
        expect(find.byType(ButtonAtom), findsOneWidget);
        expect(find.text('Crear una'), findsOneWidget);
        expect(find.text('cuenta'), findsOneWidget);
        expect(find.text('Registrarse'), findsOneWidget);
        expect(find.text('Ya tengo una cuenta'), findsOneWidget);
        expect(find.text('Ingresar'), findsOneWidget);
      });
    });
    testWidgets('validates form and calls onTapCreateAccount',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        bool createAccountCalled = false;
        await tester.pumpWidget(
          MaterialApp(
            home: CreateAccountTemplate(
              userController: userController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              onChangeUserText: (text) {},
              onChangePasswordText: (text) {},
              onChangeConfirmPasswordText: (text) {},
              onTapCreateAccount: () {
                createAccountCalled = true;
              },
              onTapLoginLink: () {},
            ),
          ),
        );

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(createAccountCalled, false);

        userController.text = 'user';
        passwordController.text = 'password123';
        confirmPasswordController.text = 'password123';
        await tester.pump();

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(createAccountCalled, true);
      });
    });
    testWidgets('shows validation error messages', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CreateAccountTemplate(
              userController: userController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              onChangeUserText: (text) {},
              onChangePasswordText: (text) {},
              onChangeConfirmPasswordText: (text) {},
              onTapCreateAccount: () {},
              onTapLoginLink: () {},
            ),
          ),
        );

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(find.text('Por favor ingrese su nombre de usuario'),
            findsOneWidget);
        expect(find.text('Por favor ingrese una contraseña'), findsOneWidget);
        expect(find.text('Por favor confirme su contraseña'), findsOneWidget);

        userController.text = 'user';
        passwordController.text = 'password123';
        confirmPasswordController.text = 'password321';
        await tester.pump();

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(find.text('Las contraseñas no coinciden'), findsOneWidget);
      });
    });

    testWidgets('calls onTapLoginLink when login link is tapped',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        bool loginLinkCalled = false;
        await tester.pumpWidget(
          MaterialApp(
            home: CreateAccountTemplate(
              userController: userController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              onChangeUserText: (text) {},
              onChangePasswordText: (text) {},
              onChangeConfirmPasswordText: (text) {},
              onTapCreateAccount: () {},
              onTapLoginLink: () {
                loginLinkCalled = true;
              },
            ),
          ),
        );
        await tester.ensureVisible(find.text('Ingresar'));
        await tester.tap(find.text('Ingresar'));
        await tester.pumpAndSettle();

        expect(loginLinkCalled, true);
      });
    });
  });
}
