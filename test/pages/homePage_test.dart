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
      var _weightIncrementButton = find.byKey(Key('weight_plus'));

      // Act: Tap the + button
      await tester.tap(_weightIncrementButton);
      await tester.pumpAndSettle(); // Ensure the UI rebuilds

      // Assert: Verify the incremented value
      var _text = find.text('161');
      expect(_text, findsOneWidget);
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
      var _weightDecrementButton = find.byKey(Key('weight_minus'));

      // Act: Tap the - button
      await tester.tap(_weightDecrementButton);
      await tester.pumpAndSettle(); // Ensure the UI rebuilds

      // Assert: Verify the decremented value
      var _text = find.text('159');
      expect(_text, findsOneWidget);
    },
  );
}
