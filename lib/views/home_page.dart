import 'package:flutter/material.dart';

import 'articles/article_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onIconClick() {}

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const ArticleList(),
        appBar: AppBar(
          title: Text(
            widget.title,
          ),
          leading: IconButton(
            tooltip: 'Menu',
            icon: const Icon(Icons.menu),
            onPressed: _onIconClick,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: _onIconClick,
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              tooltip: 'More',
              onPressed: _onIconClick,
            ),
          ],
        ),
      );
}
