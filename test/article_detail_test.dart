import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_articles/widgets/date.dart';
import 'package:ny_times_articles/global/messages.dart';
import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/views/article/article_detail.dart';

/// Widget test to test ArticleDetail view display
void main() {
  Article article1;
  Article article2;

  Widget createArticleDetailScreen1;
  Widget createArticleDetailScreen2;

  setUp(() {
    article1 = Article(
      id: 1,
      images: [],
      title: 'title 1',
      imagePath: null,
      author: 'author 1',
      section: 'section 1',
      description: 'description 1',
      creationDate: '2021-02-04',
    );

    article2 = Article(
      id: 2,
      title: 'title 2',
    );

    createArticleDetailScreen1 = MaterialApp(
      home: ArticleDetails(
        article: article1,
      ),
    );

    createArticleDetailScreen2 = MaterialApp(
      home: ArticleDetails(
        article: article2,
      ),
    );
  });

  group('Article details widget tests', () {
    testWidgets('Test article details shows up', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createArticleDetailScreen1);

      expect(find.text(article1.title), findsNWidgets(2));

      expect(find.text(article1.description), findsOneWidget);

      expect(find.text(article1.author), findsOneWidget);

      expect(find.text(article1.creationDate), findsOneWidget);

      expect(find.byType(Text), findsNWidgets(5));

      expect(find.byType(Date), findsOneWidget);
    });

    testWidgets('Test article details shows up with an error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createArticleDetailScreen2);

      expect(find.text(GlobalMessages.Error), findsOneWidget);

      expect(find.text(GlobalMessages.GoBack), findsOneWidget);

      expect(find.byType(Text), findsNWidgets(4));

      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
