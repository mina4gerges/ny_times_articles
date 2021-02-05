import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_articles/widgets/white_space.dart';

/// Widget test to test WhiteSpace widget display
void main() {
  Widget createDateScreen;

  setUp(() {
    createDateScreen = MaterialApp(
      home: WhiteSpace(),
    );
  });

  group('White space widget tests', () {
    testWidgets('Test if a white space shows up', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createDateScreen);

      expect(find.byType(SizedBox), findsOneWidget);
    });
  });
}
