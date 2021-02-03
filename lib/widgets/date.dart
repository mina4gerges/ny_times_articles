import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  final String date;
  final TextStyle textStyle;

  Date({Key key, @required this.date, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.date_range),
        Text(
          date,
          style: textStyle,
        ),
      ],
    );
  }
}
