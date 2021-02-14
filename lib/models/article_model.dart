import 'package:flutter/foundation.dart';

/// Create an Article modal to manipulate easily with the loaded data
class Article {
  Article({
    @required this.id,
    @required this.title,
    this.author,
    this.section,
    this.imagePaths,
    this.description,
    this.creationDate,
  });

  Article.fromJson(Map<String, dynamic> article) {
    List<Map<String, dynamic>> tempImages;
    List<Map<String, dynamic>> finalImages;

    // Contains an obj with two resolution, low and high
    final ImagePaths finalImagePaths =
        ImagePaths(imagePaths: Map<String, Map<String, dynamic>>());

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

        if (finalImages.isNotEmpty) {
          try {
            finalImagePaths.setImagePaths(getImageResolutions(finalImages));
          } catch (e) {
            finalImagePaths.setImagePaths(Map<String, Map<String, dynamic>>());
          }
        }
      }
    }

    id = article['id'] as int;
    imagePaths = finalImagePaths;
    title = article['title'] as String;
    author = article['byline'] as String;
    section = article['section'] as String;
    description = article['abstract'] as String;
    creationDate = article['published_date'] as String;
  }

  // Function to get two resolutions, low and height with their details (path,
  // width, height)
  Map<String, Map<String, dynamic>> getImageResolutions(
      List<Map<String, dynamic>> finalImages) {
    final Map<String, Map<String, dynamic>> imageResolutions =
        Map<String, Map<String, dynamic>>();

    try {
      // finalImages of zero is always with low resolution
      imageResolutions['lowResolutionDetail'] = getImageDetails(finalImages, 0);

      // finalImages of last index is always with height resolution
      imageResolutions['highResolutionDetail'] =
          getImageDetails(finalImages, finalImages.length - 1);

      return imageResolutions;
    } catch (e) {
      return imageResolutions;
    }
  }

  // Function to get image details, path, width, height
  Map<String, dynamic> getImageDetails(
      List<Map<String, dynamic>> finalImages, int index) {
    final Map<String, dynamic> imageDetails = Map<String, dynamic>();

    try {
      imageDetails['path'] = finalImages[index]['url'] as String;
      imageDetails['width'] = finalImages[index]['width'].toDouble() as double;
      imageDetails['height'] =
          finalImages[index]['height'].toDouble() as double;

      return imageDetails;
    } catch (e) {
      return imageDetails;
    }
  }

  int id;
  String title;
  String author;
  String section;
  String description;
  String creationDate;
  ImagePaths imagePaths;
}

class ImagePaths {
  ImagePaths({this.imagePaths});

  Map<String, Map<String, dynamic>> imagePaths;

  void setImagePaths(Map<String, Map<String, dynamic>> _imagePaths) {
    imagePaths = _imagePaths;
  }

  String getPathImageHighResolution() => imagePaths.isNotEmpty
      ? imagePaths['highResolutionDetail']['path'] as String
      : '';

  double getImageHighResolutionWidth() => imagePaths.isNotEmpty
      ? imagePaths['highResolutionDetail']['width'] as double
      : 0.0;

  double getHeightImageHighResolution() => imagePaths.isNotEmpty
      ? imagePaths['highResolutionDetail']['height'] as double
      : 0.0;

  String getImageLowResolutionPath() => imagePaths.isNotEmpty
      ? imagePaths['lowResolutionDetail']['path'] as String
      : '';

  double getImageLowResolutionWidth() => imagePaths.isNotEmpty
      ? imagePaths['lowResolutionDetail']['width'] as double
      : 0.0;

  double getImageLowResolutionHeight() => imagePaths.isNotEmpty
      ? imagePaths['lowResolutionDetail']['height'] as double
      : 0.0;
}
