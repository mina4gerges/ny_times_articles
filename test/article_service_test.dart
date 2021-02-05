import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_articles/global/api.dart';
import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/services/article_service.dart';

class MockClient extends Mock implements Client {}

/// Unit test to test ArticleService
void main() {
  MockClient client;
  ArticleService articleService;

  setUp(() {
    client = MockClient();
    articleService = ArticleService();
  });

  group("Article service tests", () {
    test('Fetch articles from API with status 200', () async {
      String json200 =
          '{"results": [{"id": 1, "title": "title", "byline": "author", "section": "section", "abstract": "description","published_date": "creationDate","media": [{"type": "image", "media-metadata": [{"url": "https://www.google.com"}]}]}]}';

      when(client.get(UrlConstants.mostPopularArticles))
          .thenAnswer((_) async => http.Response(json200, 200));

      expect(await articleService.getMostPopularArticles(client),
          isA<List<Article>>());
    });

    test('Fetch articles from API with status 500', () async {
      when(client.get(UrlConstants.mostPopularArticles))
          .thenAnswer((_) async => http.Response('Internal Server Error', 500));

      expect(articleService.getMostPopularArticles(client), throwsException);
    });
  });
}
