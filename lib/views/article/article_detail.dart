import 'package:flutter/material.dart';
import 'package:ny_times_articles/widgets/date.dart';
import 'package:ny_times_articles/widgets/error.dart';
import 'package:ny_times_articles/global/messages.dart';
import 'package:ny_times_articles/models/error_model.dart';
import 'package:ny_times_articles/widgets/white_space.dart';
import 'package:ny_times_articles/models/article_model.dart';

/// ArticleDetails view to display article detail
class ArticleDetails extends StatelessWidget {
  final Article article;

  ArticleDetails({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using Scaffold because it is stand alone page
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: _getBodyDisplay(context),
    );
  }

  // Display the body of an article and handling error if any
  Widget _getBodyDisplay(BuildContext context) {
    try {
      return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              article.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            WhiteSpace(),
            Text(article.description),
            WhiteSpace(space: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    article.author,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Date(
                  date: article.creationDate,
                  textStyle: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print("ERROR $e");

      return Error(
        errorMessage: ErrorMessage(
          description: e?.message ?? null,
          action: ErrorAction(
            title: GlobalMessages.GoBack,
            onPress: () => Navigator.pop(context),
          ),
        ),
      );
    }
  }
}
