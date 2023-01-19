import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_template/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.byType(ListView), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byType(ListView);

      // Emulate a tap on the floating action button.
      await tester.scrollUntilVisible(fab, 50);

      // Trigger a frame.
      await tester.pumpAndSettle();
    });
  });
}
