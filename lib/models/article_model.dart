import 'package:flutter/foundation.dart';

/// Create an Article modal to manipulate easily with the loaded data
class Article {
  int id;
  String title;
  String author;
  String section;
  String imagePath;
  String description;
  String creationDate;
  List<Map<String, dynamic>> images;

  Article({
    @required this.id,
    @required this.title,
    this.images,
    this.author,
    this.section,
    this.imagePath,
    this.description,
    this.creationDate,
  });

  Article.fromJson(Map<String, dynamic> article) {
    // Filter media to get only images
    List<Map<String, dynamic>> tempImages = article['media'] != null
        ? List<Map<String, dynamic>>.from(
            article['media']?.where((val) => val['type'] == 'image')?.toList())
        : [];

    // Get the first element then 'media-metadata' (contains array of image obj )
    List<Map<String, dynamic>> finalImages = tempImages.length > 0
        ? List<Map<String, dynamic>>.from(tempImages[0]['media-metadata'])
        : [];

    // Get the first element (random)
    String finalImagePath =
        finalImages.length > 0 ? finalImages[0]['url'] : null;

    id = article['id'];
    images = finalImages;
    title = article['title'];
    imagePath = finalImagePath;
    author = article['byline'];
    section = article['section'];
    description = article['abstract'];
    creationDate = article['published_date'];
  }
}
