import 'package:flutter/foundation.dart';

import '../global/messages.dart';

/// Create an ErrorMessage modal
class ErrorMessage {
  ErrorMessage({
    this.title = GlobalMessages.errorMsg,
    this.description,
    this.action,
  });

  final String title;
  final String description;
  final ErrorAction action;
}

class ErrorAction {
  ErrorAction({@required this.title, @required this.onPress});

  final String title;
  final Function() onPress;
}
