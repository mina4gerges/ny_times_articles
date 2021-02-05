import 'package:flutter/material.dart';

/// Widget to display the date value and date icon.
/// Using one required param which is the date value and optional one to set
/// date style
class Date extends StatelessWidget {
  final String date;
  final TextStyle textStyle;
  final Color iconColor;

  Date({Key key, @required this.date, this.textStyle, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.date_range,
          color: iconColor,
        ),
        Text(
          date,
          style: textStyle,
        ),
      ],
    );
  }
}
