import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:athlete_fit/main.dart';

void main() {
  testWidgets('App boots to Welcome screen', (WidgetTester tester) async {
    // Pump the real app wrapped in ProviderScope (Riverpod requirement)
    await tester.pumpWidget(
      const ProviderScope(child: AthleteFitApp()),
    );

    // Let first frame settle
    await tester.pump();

    // Sanity check: the Welcome page shows this title text
    expect(find.text('ATHLETE FIT'), findsOneWidget);
    // And the Get Started button exists
    expect(find.text('Get Started'), findsOneWidget);
  });
}
