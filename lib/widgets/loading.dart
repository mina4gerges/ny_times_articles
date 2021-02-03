import 'package:flutter/material.dart';
import 'package:ny_times_articles/global/messages.dart';
import 'package:ny_times_articles/widgets/white_space.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          WhiteSpace(),
          Text(
            GlobalMessages.Loading,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
