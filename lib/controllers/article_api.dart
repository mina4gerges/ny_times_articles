import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ny_times_articles/global/api.dart';
import 'package:ny_times_articles/models/article/article_model.dart';
import 'package:ny_times_articles/models/article/article_response.dart';

class ArticleApi {
  Future<ArticleResponse> getMostPopularArticles() async {
    try {
      var response = await http.get(UrlConstants.mostPopularArticles);

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      // Success --> get new results
      if (response.statusCode == 200) {
        List results = responseBody['results'];

        return ArticleResponse(
          articles: results.map((item) => Article.fromJson(item)).toList(),
        );
      } else
        // Error ex: api not valid
        return ArticleResponse(
          error: true,
          errorDescription: responseBody['fault']['faultstring'],
          articles: [],
        );
    } catch (e) {
      // error ex: no connection
      return ArticleResponse(
        error: true,
        errorDescription: e.message,
        articles: [],
      );
    }
  }
}
