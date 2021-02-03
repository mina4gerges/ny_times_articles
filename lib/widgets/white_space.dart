import 'package:flutter/material.dart';

class WhiteSpace extends StatelessWidget {
  final double space;

  WhiteSpace({Key key, this.space = 10.0}) : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}
