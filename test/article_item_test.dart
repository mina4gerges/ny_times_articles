import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/views/article/article_item.dart';
import 'package:ny_times_articles/widgets/date.dart';

/// Widget test to test ArticleItem view display
void main() {
  Article article1;

  Widget createArticleDetailScreen1;

  setUp(() {
    article1 = Article(
      id: 1,
      images: [],
      imagePath: null,
      title: 'title 1',
      author: 'author 1',
      section: 'section 1',
      description: 'description 1',
      creationDate: '2021-02-04',
    );

    createArticleDetailScreen1 = MaterialApp(
      home: Material(
        child: ArticleItem(
          article: article1,
        ),
      ),
    );
  });

  group('Article items widget tests', () {
    testWidgets('Test article item (all data) shows up',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createArticleDetailScreen1);

      expect(find.text(article1.title), findsOneWidget);

      expect(find.text(article1.author), findsOneWidget);

      expect(find.text(article1.creationDate), findsOneWidget);

      expect(find.text(article1.section.toUpperCase()), findsOneWidget);

      expect(find.byType(Text), findsNWidgets(4));

      expect(find.byType(CircleAvatar), findsOneWidget);

      expect(find.byType(IconButton), findsOneWidget);

      expect(find.byType(Icon), findsNWidgets(2));

      expect(find.byType(Date), findsOneWidget);
    });
  });
}
