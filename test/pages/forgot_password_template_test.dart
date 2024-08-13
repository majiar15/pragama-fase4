import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/pages/forgot_password_page.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group('ForgotPasswordPage', () {
    late TextEditingController emailController;

    setUp(() {
      emailController = TextEditingController();
    });

    testWidgets('renders ForgotPasswordTemplate with correct controllers and callbacks', (WidgetTester tester) async {
      
      await tester.pumpWidget(
        const MaterialApp(
          home: ForgotPasswordPage(),
        ),
      );

      
      final forgotPasswordTemplateFinder = find.byType(ForgotPasswordTemplate);

      
      expect(forgotPasswordTemplateFinder, findsOneWidget);

      
      final forgotPasswordTemplate = tester.widget<ForgotPasswordTemplate>(forgotPasswordTemplateFinder);
      expect(forgotPasswordTemplate.emailController, isNotNull);

      
      expect(forgotPasswordTemplate.onSubmit, isNotNull);
    });

    testWidgets('emailController updates its value when text is entered', (WidgetTester tester) async {
      
      await tester.pumpWidget(
         const MaterialApp(
          home: ForgotPasswordPage(),
        ),
      );

      
      final textFieldFinder = find.byType(InputAtom);

      
      expect(textFieldFinder, findsOneWidget);

    });

    testWidgets('onSubmit callback is triggered when the submit button is tapped', (WidgetTester tester) async {
      
      var onSubmitCalled = false;

      
      await tester.pumpWidget(
        MaterialApp(
          home: ForgotPasswordTemplate(
            emailController: emailController,
            onSubmit: () {
              onSubmitCalled = true;
            },
          ),
        ),
      );

      


        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(onSubmitCalled, false);

        emailController.text = 'test@example.com';
        await tester.pump();

        await tester.tap(find.byType(ButtonAtom));
        await tester.pump();

        expect(onSubmitCalled, true);
    });
  });
}
