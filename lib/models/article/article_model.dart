import 'package:flutter/foundation.dart';

class Article {
  int id;
  String title;
  List images;
  String author;
  String section;
  String imagePath;
  String description;
  String creationDate;

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
    List tempImages =
        article['media']?.where((val) => val['type'] == 'image')?.toList() ??
            [];

    // Get the first element then 'media-metadata' (contains array of image obj )
    List finalImages =
        tempImages.length > 0 ? tempImages[0]['media-metadata'] : [];

    // Get the first element (random)
    String finalImagePath = finalImages.length > 0 ? finalImages[0]['url'] : '';

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
