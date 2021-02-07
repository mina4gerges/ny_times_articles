import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

import '../models/article_model.dart';
import '../services/article_service.dart';

/// Create a controller to load and get articles
class ArticleController {
  ArticleController({@required this.client, @required this.articleService});

  final Client client;
  final ArticleService articleService;

  List<Article> articles = <Article>[];

  // Load articles using a controller service
  Future<void> loadData() async {
    articles = await articleService.getMostPopularArticles(client);
  }
}
