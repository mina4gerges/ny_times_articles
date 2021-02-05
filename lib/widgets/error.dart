import 'package:flutter/material.dart';
import 'package:ny_times_articles/models/error_model.dart';
import 'package:ny_times_articles/widgets/white_space.dart';

/// Widget to display error message, with a description and an action
/// Using a required param which is ErrorMessage (contains the error message,
/// error description and the action)
class Error extends StatelessWidget {
  final ErrorMessage errorMessage;

  Error({Key key, @required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),

          WhiteSpace(),

          // Display error description if exist ex: invalid client id
          errorMessage.description != null
              ? Text(
                  errorMessage.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )
              : Container(),

          WhiteSpace(space: 3.0),

          // Display an action if exist ex: Go back button
          errorMessage.action != null
              ? ElevatedButton(
                  child: Text(errorMessage.action.title),
                  onPressed: errorMessage.action.onPress,
                )
              : Container(),
        ],
      ),
    );
  }
}
