import 'package:flutter/material.dart';
import 'package:ny_times_articles/widgets/date.dart';
import 'package:ny_times_articles/widgets/white_space.dart';
import 'package:ny_times_articles/models/article_model.dart';

import 'article_detail.dart';

// ArticleItem view to display each article in the list
class ArticleItem extends StatelessWidget {
  final Article article;

  ArticleItem({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Main container
    return Container(
      height: 115,
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _getLeftColumnDisplay(article.imagePath),
          _getMiddleColumnDisplay(article),
          _getRightColumnDisplay(context),
        ],
      ),
    );
  }

  // Handle click
  void _onArticleClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetails(
          article: article,
        ),
      ),
    );
  }

  // Left side display of the article
  Widget _getLeftColumnDisplay(String imagePath) => Container(
          child: CircleAvatar(
        radius: 30.0,
        backgroundImage: imagePath != null
            ? NetworkImage(imagePath)
            : AssetImage('assets/images/ny_icon.png'),
      ));

  // Middle side display of the article
  Widget _getMiddleColumnDisplay(Article article) => Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              article?.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article?.author ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF848484),
                  ),
                ),
                WhiteSpace(space: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        article?.section?.toUpperCase() ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xFF848484),
                        ),
                      ),
                    ),
                    article.creationDate != null
                        ? Date(
                            date: article.creationDate,
                            textStyle: TextStyle(
                              color: const Color(0xFF848484),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ));

  // Right side display of the article
  Widget _getRightColumnDisplay(BuildContext context) => Container(
        child: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          tooltip: 'More',
          onPressed: () => _onArticleClick(context),
        ),
      );
}
