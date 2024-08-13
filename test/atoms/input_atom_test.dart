import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  group('InputAtom', () {
    testWidgets('renders label and icon correctly',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputAtom(
              label: 'Test Label',
              iconData: Icons.email,
              controller: controller,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
    });

 testWidgets('shows password visibility toggle when isPassword is true', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputAtom(
            label: 'Password',
            iconData: Icons.lock,
            controller: controller,
            isPassword: true,
            onChanged: (value) {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byIcon(Icons.visibility_off), findsNothing);
    expect(find.byIcon(Icons.visibility), findsOneWidget);


    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.visibility), findsNothing);
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.visibility_off), findsNothing);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
  });
    testWidgets('does not show password visibility toggle when isPassword is false',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputAtom(
              label: 'Email',
              iconData: Icons.email,
              controller: controller,
              isPassword: false,
              onChanged: (value) {},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsNothing);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
    });
    testWidgets('calls onChanged when input is changed',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      bool changed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputAtom(
              label: 'Test Input',
              controller: controller,
              onChanged: (value) {
                changed = true;
              },
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.enterText(find.byType(TextFormField), 'New Value');
      await tester.pump();

      expect(changed, true);
    });

    testWidgets('displays error message when validator returns an error',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: InputAtom(
                label: 'Test Input',
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      formKey.currentState!.validate();

      await tester.pump();

      expect(find.text('Field cannot be empty'), findsOneWidget);
    });
  });
}
