import 'package:flutter/material.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

const MaterialColor customColor = MaterialColor(
  0xFF78e0c3,
  <int, Color>{
    50: Color.fromRGBO(120, 224, 195, .1),
    100: Color.fromRGBO(120, 224, 195, .2),
    200: Color.fromRGBO(120, 224, 195, .3),
    300: Color.fromRGBO(120, 224, 195, .4),
    400: Color.fromRGBO(120, 224, 195, .5),
    500: Color.fromRGBO(120, 224, 195, .6),
    600: Color.fromRGBO(120, 224, 195, .7),
    700: Color.fromRGBO(120, 224, 195, .8),
    800: Color.fromRGBO(120, 224, 195, .9),
    900: Color.fromRGBO(120, 224, 195, 1),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'NY Times',
        home: const MyHomePage(title: 'NY Times Most Popular'),
        theme: ThemeData(
          // headline6 used for AppBar color
          primaryTextTheme: const TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          primarySwatch: customColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      );
}
