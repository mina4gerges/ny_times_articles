import 'package:flutter/material.dart';

import 'article_detail.dart';
import '../../widgets/date.dart';
import '../../widgets/white_space.dart';
import '../../models/article_model.dart';
import '../../global/defaults.dart';
import '../../widgets/image.dart';

// ArticleItem view to display each article in the list
class ArticleItem extends StatelessWidget {
  const ArticleItem({@required this.article, Key key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) => Container(
        height: 115,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _getLeftColumnDisplay(
              article?.imagePaths?.getImageLowResolutionPath(),
            ),
            _getMiddleColumnDisplay(article),
            _getRightColumnDisplay(context),
          ],
        ),
      );

  // Left side display of the article
  Widget _getLeftColumnDisplay(String imagePaths) => ClipOval(
          child: ImageWidget(
        width: 70,
        height: 70,
        isFromUrl: true,
        path: imagePaths,
      ));

  // Middle side display of the article
  Widget _getMiddleColumnDisplay(Article article) => Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              article?.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: DefaultValues.articleTitleStyle,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article?.author ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: DefaultValues.articleBodyStyle,
                ),
                const WhiteSpace(space: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        article?.section?.toUpperCase() ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DefaultValues.articleFooterStyle,
                      ),
                    ),
                    if (article.creationDate != null)
                      Date(
                        date: article.creationDate,
                        iconColor: DefaultValues.secondaryColor,
                        textStyle: DefaultValues.articleFooterStyle,
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ));

  // Right side display of the article
  Widget _getRightColumnDisplay(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        tooltip: 'More',
        onPressed: () => _onArticleClick(context),
      );

  // Handle click
  void _onArticleClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetail(
          article: article,
        ),
      ),
    );
  }
}
