import 'package:flutter/foundation.dart';

/// Create an Article modal to manipulate easily with the loaded data
class Article {
  Article({
    @required this.id,
    @required this.title,
    this.author,
    this.section,
    this.imagePath,
    this.description,
    this.creationDate,
  });

  Article.fromJson(Map<String, dynamic> article) {
    List<Map<String, dynamic>> tempImages;
    List<Map<String, dynamic>> finalImages;
    String finalImagePath;

    if (article['media'] != null) {
      // Filter media to get only images
      tempImages = List<Map<String, dynamic>>.from(
        article['media'].where((val) => val['type'] == 'image').toList()
            as List,
      );

      // Get the first element then 'media-metadata'
      // (contains array of images obj)
      if (tempImages.isNotEmpty) {
        finalImages = List<Map<String, dynamic>>.from(
          tempImages[0]['media-metadata'] as List,
        );

        // Get the first element (random)
        finalImagePath =
            (finalImages.isNotEmpty ? finalImages[0]['url'] : null) as String;
      }
    }

    id = article['id'] as int;
    title = article['title'] as String;
    imagePath = finalImagePath;
    author = article['byline'] as String;
    section = article['section'] as String;
    description = article['abstract'] as String;
    creationDate = article['published_date'] as String;
  }

  int id;
  String title;
  String author;
  String section;
  String imagePath;
  String description;
  String creationDate;
}
