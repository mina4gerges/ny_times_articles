import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ny_times_articles/widgets/error.dart';
import 'package:ny_times_articles/global/messages.dart';
import 'package:ny_times_articles/widgets/loading.dart';
import 'package:ny_times_articles/models/error_model.dart';
import 'package:ny_times_articles/models/article_model.dart';
import 'package:ny_times_articles/services/article_service.dart';
import 'package:ny_times_articles/views/article/article_item.dart';
import 'package:ny_times_articles/controllers/article_controller.dart';

/// ArticleList view to display all articles (using StatefulWidget because we
/// are changing stats e.x: set articles data...)
class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  ArticleController articleController =
      ArticleController(articleService: ArticleService(), client: Client());

  bool error = false;
  bool isLoading = false;
  String errorDescription = '';
  List<Article> articles = <Article>[];

  @override
  void initState() {
    super.initState();
    _getMostPopularArticles();
  }

  // Fetch data using a controller and handle errors and loading status
  void _getMostPopularArticles() async {
    try {
      setState(() {
        isLoading = true;
      });

      await articleController.loadData();

      setState(() {
        error = false;
        isLoading = false;
        errorDescription = '';
        articles = articleController.articles;
      });
    } catch (e) {
      setState(() {
        error = true;
        articles = [];
        isLoading = false;
        errorDescription = e?.message ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Display a loading message while waiting for data to be fetched
    if (isLoading) {
      return Loading();
    }

    // Display a error message if any
    if (error)
      return Error(
        errorMessage: ErrorMessage(
          description: errorDescription,
          action: ErrorAction(
            title: GlobalMessages.Refresh,
            onPress: _getMostPopularArticles,
          ),
        ),
      );

    // If no articles found, display an error message
    if (articles.length == 0)
      return Error(
        errorMessage: ErrorMessage(
          title: GlobalMessages.NoArticlesFound,
          action: ErrorAction(
            title: GlobalMessages.Refresh,
            onPress: _getMostPopularArticles,
          ),
        ),
      );

    // Display all fetched data in a list
    return ListView.separated(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return ArticleItem(article: articles[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
