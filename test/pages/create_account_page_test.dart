import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/atoms/button_atom.dart';
import 'package:store_design_system/pages/create_account_page.dart';
import 'package:store_design_system/templates/create_account_template.dart';

void main() {
  group('CreateAccountPage Tests', () {
    testWidgets('renders CreateAccountTemplate and triggers callbacks',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CreateAccountPage(),
        ),
      );

      final usernameField = find.byType(TextField).first;
      final passwordField = find.byType(TextField).last;

      await tester.enterText(usernameField, 'testuser');
      await tester.pumpAndSettle();

      await tester.enterText(passwordField, 'testpassword');
      await tester.pumpAndSettle();

      expect(find.text('testuser'), findsOneWidget);
      expect(find.text('testpassword').first, findsOneWidget);

      final createAccountButton = find.byType(ButtonAtom);
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      expect(find.byType(CreateAccountTemplate), findsOneWidget);
    });
  });
}
