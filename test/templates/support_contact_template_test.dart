import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';

void main() {
  testWidgets('SupportContactTemplate widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SupportContactTemplate(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('Nombre'), findsOneWidget);
    expect(find.text('Correo Electrónico'), findsOneWidget);
    expect(find.text('Asunto'), findsOneWidget);
    expect(find.text('Mensaje'), findsOneWidget);

    
    expect(find.byType(ElevatedButton), findsOneWidget);

    
    await tester.enterText(find.byType(InputAtom).at(0), 'John Doe');
    await tester.enterText(find.byType(InputAtom).at(1), 'johndoe@example.com');
    await tester.enterText(find.byType(InputAtom).at(2), 'Consulta');
    await tester.enterText(find.byType(TextAreaAtom), 'Este es un mensaje de prueba.');

    
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('johndoe@example.com'), findsOneWidget);
    expect(find.text('Consulta'), findsOneWidget);
    expect(find.text('Este es un mensaje de prueba.'), findsOneWidget);

    
    await tester.tap(find.byType(ElevatedButton), warnIfMissed: false);
    await tester.pumpAndSettle( const Duration(seconds: 2));
  });
}
