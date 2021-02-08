import 'package:flutter/material.dart';

import '../global/messages.dart';
import '../global/defaults.dart';
import '../widgets/white_space.dart';

/// Widget to display a loading message and a circular loading indicator
class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircularProgressIndicator(),
            WhiteSpace(),
            Text(
              GlobalMessages.loadingMsg,
              style: DefaultValues.loadingMsgStyle,
            ),
          ],
        ),
      );
}
