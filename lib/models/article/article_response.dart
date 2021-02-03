import 'package:flutter/foundation.dart';

import 'article_model.dart';

class ArticleResponse {
  final bool error;
  final List<Article> articles;
  final String errorDescription;

  ArticleResponse({
    @required this.articles,
    this.error = false,
    this.errorDescription = '',
  });
}
