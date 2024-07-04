import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo_app/widgets/numbers_timer.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: NumbersTimer(seconds: 300),
    ));

    // Verify conversion of ss to mm:ss
    expect(find.text('05:00'), findsOne);
    expect(find.text('300'), findsNothing);
  });
}
