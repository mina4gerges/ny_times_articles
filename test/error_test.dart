import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_articles/widgets/error.dart';
import 'package:ny_times_articles/global/messages.dart';
import 'package:ny_times_articles/models/error_model.dart';

void main() {
  Widget createErrorScreen1;
  Widget createErrorScreen2;
  Widget createErrorScreen3;

  _test() => {
        print("hi"),
      };

  setUp(() {
    // Default error message
    createErrorScreen1 = MaterialApp(
      home: Error(
        errorMessage: ErrorMessage(),
      ),
    );

    // Custom error message
    createErrorScreen2 = MaterialApp(
      home: Error(
        errorMessage: ErrorMessage(
          title: 'error title',
          description: 'error description',
        ),
      ),
    );

    // Custom error message with action
    createErrorScreen3 = MaterialApp(
      home: Error(
        errorMessage: ErrorMessage(
          action: ErrorAction(
            title: 'go back',
            onPress: _test,
          ),
        ),
      ),
    );
  });

  group('Error widget tests', () {
    testWidgets('Test default error message', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createErrorScreen1);

      expect(find.text(GlobalMessages.Error), findsNWidgets(1));

      expect(find.byType(ElevatedButton), findsNothing);

      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('Test custom error message', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createErrorScreen2);

      expect(find.text('error title'), findsOneWidget);

      expect(find.text('error description'), findsOneWidget);

      expect(find.byType(ElevatedButton), findsNothing);

      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('Test default error message with action',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createErrorScreen3);

      expect(find.text(GlobalMessages.Error), findsOneWidget);

      expect(find.byType(ElevatedButton), findsOneWidget);

      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}
