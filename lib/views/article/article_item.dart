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

  // Left side display of the article
  Widget _getLeftColumnDisplay(String imagePath) {
    final width = 70.0;
    final height = 70.0;
    final defaultImage = AssetImage('assets/images/ny_icon.png');

    return Container(
      child: ClipOval(
        // If imagePath is found, display the provided path, else display a default image.
        child: imagePath != null
            ? Image.network(
                imagePath,
                width: width,
                height: height,
                fit: BoxFit.cover,
                // If error while fetching the image, display a default image
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace stackTrace) {
                  return Image(
                    width: width,
                    height: height,
                    image: defaultImage,
                  );
                },
              )
            : Image(
                width: width,
                height: height,
                image: defaultImage,
              ),
      ),
    );
  }

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
                            iconColor: const Color(0xFF848484),
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
