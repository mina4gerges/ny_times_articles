import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_articles/global/defaults.dart';
import 'package:ny_times_articles/widgets/image.dart';

/// Widget test, to test ImageWidget
void main() {
  Widget createDateScreen1;
  Widget createDateScreen2;
  Widget createDateScreen3;

  setUp(() {
    createDateScreen1 = MaterialApp(
      home: ImageWidget(
        path: DefaultValues.defaultImagePath,
      ),
    );

    createDateScreen2 = MaterialApp(
      home: ImageWidget(),
    );

    createDateScreen3 = MaterialApp(
      home: ImageWidget(
        isFromUrl: true,
        path: 'https://i.pinimg.com/564x/2a/d6/0a/2ad60a09e1a5bf18fb2'
            'd939b7822cd99.jpg',
      ),
    );
  });

  group('Image imageWidget tests', () {
    testWidgets(
        'Test if image, without fetching from network, with path, shows up',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createDateScreen1);

      expect(find.byType(Image), findsOneWidget);
    });
  });

  testWidgets(
      'Test if image, without fetching from network, without path, shows up',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createDateScreen2);

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Test if image, with fetching from network, with path, shows up',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createDateScreen3);

    expect(find.byType(Image), findsOneWidget);
  });
}
