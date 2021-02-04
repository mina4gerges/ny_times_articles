import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/services/article_service.dart';

class ArticleController {
  ArticleService articleService = ArticleService();

  List<Article> articles = List<Article>();

  Future<void> loadData() async {
    articles = await articleService.getMostPopularArticles();
  }
}
