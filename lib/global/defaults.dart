import 'package:flutter/material.dart';

/// Set all defaults values in one single class
abstract class DefaultValues {
  static const String defaultImagePath = 'assets/images/ny_icon.png';
  static const Color secondaryColor = Color(0xFF848484);

  // Article default style
  static const TextStyle articleTitleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle articleBodyStyle = TextStyle(
    color: secondaryColor,
  );
  static const TextStyle articleFooterStyle = TextStyle(
    color: secondaryColor,
  );

  // Error default style
  static const TextStyle errorTitleStyle = TextStyle(
    fontSize: 20,
  );
  static const TextStyle errorDescriptionStyle = TextStyle(
    color: secondaryColor,
  );

  // Loading default style
  static const TextStyle loadingMsgStyle = TextStyle(
    fontSize: 16,
  );
}
