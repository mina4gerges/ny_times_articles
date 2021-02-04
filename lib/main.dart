import 'package:flutter/material.dart';
import 'views/article/article_list.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor customColor = const MaterialColor(
  0xFF78e0c3,
  const <int, Color>{
    50: const Color.fromRGBO(120, 224, 195, .1),
    100: const Color.fromRGBO(120, 224, 195, .2),
    200: const Color.fromRGBO(120, 224, 195, .3),
    300: const Color.fromRGBO(120, 224, 195, .4),
    400: const Color.fromRGBO(120, 224, 195, .5),
    500: const Color.fromRGBO(120, 224, 195, .6),
    600: const Color.fromRGBO(120, 224, 195, .7),
    700: const Color.fromRGBO(120, 224, 195, .8),
    800: const Color.fromRGBO(120, 224, 195, .9),
    900: const Color.fromRGBO(120, 224, 195, 1),
  },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NY Times',
      theme: ThemeData(
        // headline6 used for AppBar color
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        primarySwatch: customColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'NY Times Most Popular'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onIconClick() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArticleList(),
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        leading: IconButton(
          tooltip: 'Menu',
          icon: const Icon(Icons.menu),
          onPressed: () => _onIconClick(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => _onIconClick(),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'More',
            onPressed: () => _onIconClick(),
          ),
        ],
      ),
    );
  }
}
