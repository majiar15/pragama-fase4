import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/pages/login_page.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group('LoginPage tests', () {
    testWidgets('should render LoginPage with all elements', (WidgetTester tester) async {
      
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
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

    testWidgets('triggers onTapForgotPassword callback correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      await tester.tap(find.text('¿Has olvidado tu contraseña?'));
      await tester.pump();

      expect(tester.takeException(), isNull);
    });

    testWidgets('triggers onTapLogin callback correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      await tester.tap(find.byType(ButtonAtom));
      await tester.pump();

      expect(tester.takeException(), isNull);
    });

    testWidgets('triggers onTapSignUp callback correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      await tester.tap(find.text('Registrarse'));
      await tester.pump();

      expect(tester.takeException(), isNull);
    });

    testWidgets('triggers onChangePasswordText callback correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      await tester.enterText(find.byType(TextFormField).last, 'new password');
      await tester.pump();

      
      expect(tester.takeException(), isNull);
    });

    testWidgets('triggers onChangeUserText callback correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      await tester.enterText(find.byType(TextFormField).first, 'new user');
      await tester.pump();

      
      expect(tester.takeException(), isNull);
    });
  });
}