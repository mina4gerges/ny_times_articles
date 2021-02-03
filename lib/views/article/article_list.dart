import 'package:flutter/material.dart';
import 'package:ny_times_articles/widgets/error.dart';
import 'package:ny_times_articles/global/messages.dart';
import 'package:ny_times_articles/widgets/loading.dart';
import 'package:ny_times_articles/models/error_model.dart';
import 'package:ny_times_articles/controllers/article_api.dart';
import 'package:ny_times_articles/views/article/article_item.dart';
import 'package:ny_times_articles/models/article/article_model.dart';
import 'package:ny_times_articles/models/article/article_response.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  ArticleApi api = ArticleApi();

  bool error = false;
  bool isLoading = false;
  String errorDescription = '';
  List<Article> articles = new List<Article>();

  @override
  void initState() {
    super.initState();
    _getMostPopularArticles();
  }

  void _getMostPopularArticles() async {
    try {
      setState(() {
        isLoading = true;
      });

      ArticleResponse articleResponse = await api.getMostPopularArticles();

      setState(() {
        isLoading = false;
        error = articleResponse.error;
        articles = articleResponse.articles;
        errorDescription = articleResponse.errorDescription;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        error = true;
        articles = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return Loading();

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
    
    return ListView.separated(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return ArticleItem(article: articles[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
