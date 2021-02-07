import 'package:flutter/material.dart';

/// Widget to display a white space
/// Using one param white is the space that i want to use, with a default
/// value equal to 10.0
class WhiteSpace extends StatelessWidget {
  const WhiteSpace({Key key, this.space = 10.0}) : super(key: key);

  final double space;

  @override
  Widget build(BuildContext context) => SizedBox(height: space);
}
