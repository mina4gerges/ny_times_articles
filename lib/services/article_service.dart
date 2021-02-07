import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';

import '../global/api.dart';
import '../global/messages.dart';
import '../models/article_model.dart';

/// Fetch data using a service and handling errors
class ArticleService {
  Future<List<Article>> getMostPopularArticles(Client client) async {
    try {
      final Response response =
          await client.get(UrlConstants.mostPopularArticles);

      final Map<String, dynamic> responseBody =
          jsonDecode(response.body) as Map<String, dynamic>;

      // Success --> get new results
      if (response.statusCode == 200) {
        // 'List<Article>.from' is used fro casting to type List<Article>
        // instead List<dynamic>
        return List<Article>.from(
          responseBody['results']
              .map((i) => Article.fromJson(i as Map<String, dynamic>))
              .toList() as List,
        );
      }
      // Error ex: api not valid
      else {
        throw Exception(responseBody['fault']['faultstring']);
      }
    } on SocketException {
      throw Exception(GlobalMessages.noInternetConnectionMsg);
    } catch (e) {
      throw Exception(e?.message ?? GlobalMessages.unknownErrorMsg);
    }
  }
}
