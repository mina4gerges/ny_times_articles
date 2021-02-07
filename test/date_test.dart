import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ny_times_articles/widgets/date.dart';

/// Widget test to test Date widget display
void main() {
  Widget createDateScreen;

  setUp(() {
    createDateScreen = MaterialApp(
      home: Date(date: '2020-12-12'),
    );
  });

  group('Date widget tests', () {
    testWidgets('Test date label and icon shows up',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createDateScreen);

      expect(find.text('2020-12-12'), findsOneWidget);

      expect(find.byIcon(Icons.date_range), findsOneWidget);

      expect(find.byType(Text), findsOneWidget);

      expect(find.byType(Icon), findsOneWidget);
    });
  });
}
