import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/atoms/text_area_atom.dart';

void main() {
group('TextAreaAtom tests', () {
  late TextEditingController controller;
  late String? Function(String?)? validator;

  setUp(() {
    controller = TextEditingController();
    validator = (value) {
      if (value!.isEmpty) {
        return 'Campo requerido';
      }
      return null;
    };
  });

  tearDown(() {
    controller.dispose();
  });

  testWidgets('TextAreaAtom widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextAreaAtom(
            iconData: Icons.text_fields,
            label: 'Prueba',
            controller: controller,
            maxLines: 5,
            validator: validator,
          ),
        ),
      ),
    );

    expect(find.byType(TextAreaAtom), findsOneWidget);
    expect(find.byIcon(Icons.text_fields), findsOneWidget);
    expect(find.text('Prueba'), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
  });

  testWidgets('TextAreaAtom validation test', (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: TextAreaAtom(
              iconData: Icons.text_fields,
              label: 'Prueba',
              controller: controller,
              maxLines: 5,
              validator: validator,
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(TextFormField));
    await tester.pump();


    await tester.enterText(find.byType(TextFormField), '');
    final formState = tester.state<FormState>(find.byType(Form));
    formState.validate();
    await tester.pump();


    expect(find.text('Campo requerido'), findsOneWidget);
  });

  testWidgets('TextAreaAtom maxLines test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextAreaAtom(
            iconData: Icons.text_fields,
            label: 'Prueba',
            controller: controller,
            maxLines: 2,
          ),
        ),
      ),
    );

    expect(find.byType(TextAreaAtom), findsOneWidget);
    final textInput = tester.widget<TextAreaAtom>(find.byType(TextAreaAtom));
    expect(textInput.maxLines, 2);
  });
});
}
