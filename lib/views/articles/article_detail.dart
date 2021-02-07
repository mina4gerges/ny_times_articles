import 'package:flutter/material.dart';

import '../../widgets/date.dart';
import '../../widgets/error.dart';
import '../../global/messages.dart';
import '../../models/error_model.dart';
import '../../widgets/white_space.dart';
import '../../models/article_model.dart';

/// ArticleDetail view to display article detail
class ArticleDetail extends StatelessWidget {
  const ArticleDetail({@required this.article, Key key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(GlobalMessages.articleDetailPageTitle),
        ),
        body: _getBodyDisplay(context),
      );

  // Display the body of an article and handling error if any
  Widget _getBodyDisplay(BuildContext context) {
    try {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const WhiteSpace(),
            Text(article.description),
            const WhiteSpace(space: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    article.author,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Date(
                  date: article.creationDate,
                  textStyle: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      return Error(
        errorMessage: ErrorMessage(
          description: (e?.message ?? '') as String,
          action: ErrorAction(
            title: GlobalMessages.goBackMsg,
            onPress: () => Navigator.pop(context),
          ),
        ),
      );
    }
  }
}
