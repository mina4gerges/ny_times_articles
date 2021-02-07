import 'package:http/http.dart';
import 'package:flutter/material.dart';

import 'article_item.dart';
import '../../widgets/error.dart';
import '../../global/messages.dart';
import '../../widgets/loading.dart';
import '../../models/error_model.dart';
import '../../models/article_model.dart';
import '../../services/article_service.dart';
import '../../controllers/article_controller.dart';

/// ArticleList view to display all articles (using StatefulWidget because we
/// are changing stats e.x: set articles data...)
class ArticleList extends StatefulWidget {
  const ArticleList({Key key}) : super(key: key);

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
  Future<void> _getMostPopularArticles() async {
    try {
      setState(() {
        isLoading = true;
      });

      await articleController.loadData();

      setState(() {
        error = false;
        errorDescription = '';
        articles = articleController.articles;
      });
    } catch (e) {
      setState(() {
        error = true;
        articles = <Article>[];
        errorDescription = (e?.message ?? '') as String;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Display a loading message while waiting for data to be fetched
    if (isLoading) {
      return const Loading();
    }

    // Display a error message if any
    if (error) {
      return Error(
        errorMessage: ErrorMessage(
          description: errorDescription,
          action: ErrorAction(
            title: GlobalMessages.refreshMsg,
            onPress: _getMostPopularArticles,
          ),
        ),
      );
    }

    // If no articles found, display an error message
    if (articles.isEmpty) {
      return Error(
        errorMessage: ErrorMessage(
          title: GlobalMessages.noArticlesFoundMsg,
          action: ErrorAction(
            title: GlobalMessages.refreshMsg,
            onPress: _getMostPopularArticles,
          ),
        ),
      );
    }

    // Display all fetched data in a list
    return ListView.separated(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) =>
          ArticleItem(article: articles[index]),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
