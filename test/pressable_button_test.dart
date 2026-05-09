import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pressable_button/pressable_button.dart';

void main() {
  testWidgets('renders child widget', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PressableButton(
            onPressed: () {},
            child: const Text('Click Me'),
          ),
        ),
      ),
    );

    expect(find.text('Click Me'), findsOneWidget);
  });

  testWidgets('calls onPressed when tapped', (tester) async {
    var pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PressableButton(
            onPressed: () {
              pressed = true;
            },
            child: const Text('Tap'),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(PressableButton));
    await tester.pumpAndSettle();

    expect(pressed, isTrue);
  });
}
