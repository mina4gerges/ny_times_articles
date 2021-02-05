import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/services/article_service.dart';

/// Create a controller to load and get articles
class ArticleController {
  final ArticleService articleService;

  ArticleController({this.articleService});

  List<Article> articles = List<Article>();

  // Load articles using a controller service
  Future<void> loadData() async {
    articles = await articleService.getMostPopularArticles();
  }
}
