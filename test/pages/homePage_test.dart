import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/pages/homePage.dart';

void main() {
  testWidgets(
    'Given weightInfoCard When user click + button Then weight increment by 1',
    (tester) async {
      // Arrange: Pump the widget
      await tester.pumpWidget(
        CupertinoApp(
          home: Homepage(),
        ),
      );
      
      // Find the + button
      var weightIncrementButton = find.byKey(const Key('weight_plus'));

      // Act: Tap the + button
      await tester.tap(weightIncrementButton);
      await tester.pumpAndSettle(); // Ensure the UI rebuilds

      // Assert: Verify the incremented value
      var text = find.text('161');
      expect(text, findsOneWidget);
    },
  );

  testWidgets(
    'Given weightInfoCard When user click - button Then weight decremented by 1',
    (tester) async {
      // Arrange: Pump the widget
      await tester.pumpWidget(
        CupertinoApp(
          home: Homepage(),
        ),
      );
      
      // Find the - button
      var weightDecrementButton = find.byKey(const Key('weight_minus'));

      // Act: Tap the - button
      await tester.tap(weightDecrementButton);
      await tester.pumpAndSettle(); // Ensure the UI rebuilds

      // Assert: Verify the decremented value
      var text = find.text('159');
      expect(text, findsOneWidget);
    },
  );
}
