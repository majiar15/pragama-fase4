import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group('LoginTemplate Tests', () {
    late TextEditingController userController;
    late TextEditingController passwordController;

    setUp(() {
      userController = TextEditingController();
      passwordController = TextEditingController();
    });

    testWidgets('renders all widgets correctly', (WidgetTester tester) async {
      
      await tester.pumpWidget(
        MaterialApp(
          home: LoginTemplate(
            userController: userController,
            passwordController: passwordController,
            onTapForgotPassword: () {},
            onTapLogin: () {},
            onTapSignUp: () {},
          ),
        ),
      );

      
      expect(find.text('¡Bienvenido'), findsOneWidget);
      expect(find.text('De nuevo!'), findsOneWidget);
      expect(find.text('Usuario'), findsOneWidget);
      expect(find.text('Contraseña'), findsOneWidget);
      expect(find.text('¿Has olvidado tu contraseña?'), findsOneWidget);
      expect(find.text('Ingresar'), findsOneWidget);
      expect(find.text('Crear una cuenta '), findsOneWidget);
      expect(find.text('Registrarse'), findsOneWidget);
    });

    testWidgets('validates user input and triggers login callback on valid submission', (WidgetTester tester) async {
      
      bool loginTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: LoginTemplate(
            userController: userController,
            passwordController: passwordController,
            onTapForgotPassword: () {},
            onTapLogin: () {
              loginTapped = true;
            },
            onTapSignUp: () {},
          ),
        ),
      );

      
      await tester.enterText(find.byType(InputAtom).first, 'testuser');
      await tester.enterText(find.byType(InputAtom).last, 'password123');
      await tester.tap(find.text('Ingresar'));
      await tester.pump();

      
      expect(loginTapped, true);
    });

    testWidgets('shows validation errors when fields are empty or invalid', (WidgetTester tester) async {
      
      await tester.pumpWidget(
        MaterialApp(
          home: LoginTemplate(
            userController: userController,
            passwordController: passwordController,
            onTapForgotPassword: () {},
            onTapLogin: () {},
            onTapSignUp: () {},
          ),
        ),
      );

      
      await tester.tap(find.text('Ingresar'));
      await tester.pump();

      
      expect(find.text('Por favor ingrese su nombre de usuario'), findsOneWidget);
      expect(find.text('Por favor ingrese su contraseña'), findsOneWidget);

      
      await tester.enterText(find.byType(InputAtom).first, 'testuser');
      await tester.enterText(find.byType(InputAtom).last, '123');
      await tester.tap(find.text('Ingresar'));
      await tester.pump();

      
      expect(find.text('La contraseña debe tener al menos 6 caracteres'), findsOneWidget);
    });

    testWidgets('calls onTapForgotPassword and onTapSignUp callbacks', (WidgetTester tester) async {
      
      bool forgotPasswordTapped = false;
      bool signUpTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: LoginTemplate(
            userController: userController,
            passwordController: passwordController,
            onTapForgotPassword: () {
              forgotPasswordTapped = true;
            },
            onTapLogin: () {},
            onTapSignUp: () {
              signUpTapped = true;
            },
          ),
        ),
      );

      
      await tester.tap(find.text('¿Has olvidado tu contraseña?'));
      await tester.pump();

      
      expect(forgotPasswordTapped, true);

      
      await tester.tap(find.text('Registrarse'));
      await tester.pump();

      
      expect(signUpTapped, true);
    });
  });
}
