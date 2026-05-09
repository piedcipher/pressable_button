import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('example app renders button', (tester) async {
    await tester.pumpWidget(const ExampleApp());

    expect(find.text('Click Me'), findsOneWidget);
  });
}
