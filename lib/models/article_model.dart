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
    ImagePaths finalImagePaths =
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
            print("e");
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
    Map<String, Map<String, dynamic>> imageResolutions =
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
    Map<String, dynamic> imageDetails = Map<String, dynamic>();

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

  String getPathImageHighResolution() =>
      imagePaths['highResolutionDetail']['path'] as String;

  double getImageHighResolutionWidth() =>
      imagePaths['highResolutionDetail']['width'] as double;

  double getHeightImageHighResolution() =>
      imagePaths['highResolutionDetail']['height'] as double;

  String getImageLowResolutionPath() =>
      imagePaths['lowResolutionDetail']['path'] as String;

  double getImageLowResolutionWidth() =>
      imagePaths['lowResolutionDetail']['width'] as double;

  double getImageLowResolutionHeight() =>
      imagePaths['lowResolutionDetail']['height'] as double;
}
