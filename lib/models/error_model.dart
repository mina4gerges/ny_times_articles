import 'package:flutter/foundation.dart';
import 'package:ny_times_articles/global/messages.dart';

/// Create an ErrorMessage modal
class ErrorMessage {
  final String title;
  final String description;
  final ErrorAction action;

  ErrorMessage({
    this.title = GlobalMessages.Error,
    this.description,
    this.action,
  });
}

class ErrorAction {
  final String title;
  final Function onPress;

  ErrorAction({@required this.title, @required this.onPress});
}
