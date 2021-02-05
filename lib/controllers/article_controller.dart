import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/services/article_service.dart';

/// Create a controller to load and get articles
class ArticleController {
  final Client client;
  final ArticleService articleService;

  ArticleController({@required this.articleService, @required this.client});

  List<Article> articles = <Article>[];

  // Load articles using a controller service
  Future<void> loadData() async {
    articles = await articleService.getMostPopularArticles(client);
  }
}
