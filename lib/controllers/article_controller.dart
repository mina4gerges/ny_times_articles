import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/services/article_service.dart';

class ArticleController {
  final ArticleService articleService;

  ArticleController({this.articleService});

  List<Article> articles = List<Article>();

  Future<void> loadData() async {
    articles = await articleService.getMostPopularArticles();
  }
}
