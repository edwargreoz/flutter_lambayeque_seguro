// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// 1. Asegúrate de que esta importación sea correcta.
import 'package:flutter_lambayeque_seguro/main.dart'; 

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    
    // 2. ¡CORRECCIÓN AQUÍ! Reemplaza 'MyApp()' por 'LambayequeSeguroApp()'
    await tester.pumpWidget(const LambayequeSeguroApp()); 

    // Verify that our counter starts at 0.
    // ... (el resto del código de prueba del contador se mantiene o se ajusta si lo quieres usar)
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}