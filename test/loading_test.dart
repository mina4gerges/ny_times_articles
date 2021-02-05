import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_articles/global/messages.dart';
import 'package:ny_times_articles/widgets/loading.dart';

/// Widget test to test Loading widget display
void main() {
  Widget createLoadingScreen;

  setUp(() {
    createLoadingScreen = MaterialApp(
      home: Loading(),
    );
  });

  group('Loading widget tests', () {
    testWidgets('Test loading message shows up', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createLoadingScreen);

      expect(find.text(GlobalMessages.Loading), findsOneWidget);

      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('Test circularIndicator shows up',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createLoadingScreen);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
