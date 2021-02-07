import 'package:flutter/material.dart';

import 'article_detail.dart';
import '../../widgets/date.dart';
import '../../widgets/white_space.dart';
import '../../models/article_model.dart';

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
            _getLeftColumnDisplay(article.imagePath),
            _getMiddleColumnDisplay(article),
            _getRightColumnDisplay(context),
          ],
        ),
      );

  // Left side display of the article
  Widget _getLeftColumnDisplay(String imagePath) {
    const double width = 70;
    const double height = 70;
    const AssetImage defaultImage = AssetImage('assets/images/ny_icon.png');

    return ClipOval(
      // If imagePath is found, display the provided path, else display a
      // default image.
      child: imagePath != null
          ? Image.network(
              imagePath,
              width: width,
              height: height,
              fit: BoxFit.cover,
              // If error while fetching the image, display a default image
              errorBuilder: (BuildContext context, Object exception,
                      StackTrace stackTrace) =>
                  const Image(
                width: width,
                height: height,
                image: defaultImage,
              ),
            )
          : const Image(
              width: width,
              height: height,
              image: defaultImage,
            ),
    );
  }

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
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article?.author ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF848484),
                  ),
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
                        style: const TextStyle(
                          color: Color(0xFF848484),
                        ),
                      ),
                    ),
                    if (article.creationDate != null)
                      Date(
                        date: article.creationDate,
                        iconColor: const Color(0xFF848484),
                        textStyle: const TextStyle(
                          color: Color(0xFF848484),
                        ),
                      )
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
