import 'package:flutter/material.dart';
import 'package:ny_times_articles/models/error_model.dart';
import 'package:ny_times_articles/widgets/white_space.dart';

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

          // Display error description if exist e.x invalid client id
          errorMessage.description != null
              ? Text(
                  errorMessage.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )
              : Container(),

          WhiteSpace(space: 3.0),

          // Display an action if exist i.e: Go back button
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
