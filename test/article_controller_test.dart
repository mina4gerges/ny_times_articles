import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/services/article_service.dart';
import 'package:ny_times_articles/controllers/article_controller.dart';

class MockArticleService extends Mock implements ArticleService {}

void main() {
  ArticleController articleController;
  MockArticleService mockArticleService;

  setUp(() {
    mockArticleService = MockArticleService();
    articleController = ArticleController(articleService: mockArticleService);
  });

  group("Article controller test", () {
    test("Article controllers with values", () async {
      when(mockArticleService.getMostPopularArticles()).thenAnswer(
        (_) => Future.value(
          [
            Article(id: 1, title: 'article 1'),
            Article(id: 2, title: 'article 2'),
          ],
        ),
      );

      await articleController.loadData();

      expect(articleController.articles[0].title, "article 1");
    });

    test("Article controllers with empty values", () async {
      when(mockArticleService.getMostPopularArticles()).thenAnswer(
        (_) => Future.value([]),
      );

      await articleController.loadData();

      expect(articleController.articles, []);
    });
  });
}
