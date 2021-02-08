import 'package:flutter/material.dart';

import '../../widgets/date.dart';
import '../../widgets/error.dart';
import '../../widgets/image.dart';
import '../../global/defaults.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              article.title,
              textAlign: TextAlign.center,
              style: DefaultValues.articleTitleStyle,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: ImageWidget(
                        isFromUrl: true,
                        path: article?.imagePaths?.getPathImageHighResolution(),
                        // -20 because of Container padding
                        // (padding: const EdgeInsets.all(10))
                        width: MediaQuery.of(context).size.width - 20,
                        height:
                            article?.imagePaths?.getHeightImageHighResolution(),
                      ),
                    ),
                  ],
                ),
                const WhiteSpace(space: 20),
                Text(article.description),
              ],
            ),
            const WhiteSpace(space: 15),
            Container(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      article.author,
                      style: DefaultValues.articleFooterStyle,
                    ),
                  ),
                  Date(
                    date: article.creationDate,
                    iconColor: DefaultValues.secondaryColor,
                    textStyle: DefaultValues.articleFooterStyle,
                  ),
                ],
              ),
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
