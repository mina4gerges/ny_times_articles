import 'package:flutter/material.dart';
import 'package:ny_times_articles/widgets/date.dart';
import 'package:ny_times_articles/widgets/white_space.dart';
import 'package:ny_times_articles/models/article/article_model.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;

  ArticleDetails({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
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
      ),
    );
  }
}
