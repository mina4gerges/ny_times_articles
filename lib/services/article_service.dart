import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';

import 'package:ny_times_articles/global/api.dart';
import 'package:ny_times_articles/global/messages.dart';
import 'package:ny_times_articles/models/article_model.dart';

/// Fetch data using a service and handling errors
class ArticleService {
  Future<List<Article>> getMostPopularArticles(Client client) async {
    try {
      var response = await client.get(UrlConstants.mostPopularArticles);

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      // Success --> get new results
      if (response.statusCode == 200)
        // 'List<Article>.from' is used fro casting to type List<Article> instead List<dynamic>
        return List<Article>.from(
          responseBody['results'].map((i) => Article.fromJson(i)),
        );

      // Error ex: api not valid
      else
        throw Exception(responseBody['fault']['faultstring']);
    } on SocketException {
      throw Exception(GlobalMessages.NoInternetConnection);
    } catch (e) {
      print("CATCH: $e");
      throw Exception(e?.message ?? GlobalMessages.UnknownError);
    }
  }
}
