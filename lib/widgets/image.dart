import 'package:flutter/material.dart';
import 'package:ny_times_articles/global/defaults.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    this.path,
    this.width,
    this.height,
    this.isFromUrl = false,
    this.fit = BoxFit.cover,
    Key key,
  }) : super(key: key);

  final BoxFit fit;
  final String path;
  final double width;
  final double height;
  final bool isFromUrl;

  @override
  Widget build(BuildContext context) {
    if (isFromUrl && path != null) {
      return Image.network(
        path,
        fit: fit,
        width: width,
        height: height,
        // Set an loading indicator while fetching image from network
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            width: width,
            height: height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        // If error while fetching the image, display a default image
        errorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) =>
                Image(
          width: width,
          height: height,
          image: const AssetImage(DefaultValues.defaultImagePath),
        ),
      );
    } else {
      return Image(
        width: width,
        height: height,
        image: AssetImage(path != null ? path : DefaultValues.defaultImagePath),
      );
    }
  }
}
