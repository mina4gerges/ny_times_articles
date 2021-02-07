import 'package:flutter/material.dart';

import '../models/error_model.dart';
import '../widgets/white_space.dart';

/// Widget to display error message, with a description and an action
/// Using a required param which is ErrorMessage (contains the error message,
/// error description and the action)
class Error extends StatelessWidget {
  const Error({@required this.errorMessage, Key key}) : super(key: key);

  final ErrorMessage errorMessage;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              errorMessage.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),

            const WhiteSpace(),

            // Display error description if exist ex: invalid client id
            if (errorMessage.description != null)
              Text(
                errorMessage.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),

            const WhiteSpace(space: 3),

            // Display an action if exist ex: Go back button
            if (errorMessage.action != null)
              ElevatedButton(
                onPressed: errorMessage.action.onPress,
                child: Text(
                  errorMessage.action.title,
                ),
              )
          ],
        ),
      );
}
