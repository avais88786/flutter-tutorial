import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavouritesList extends StatelessWidget {
  final Set<WordPair> savedList;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  FavouritesList({Key key, @required this.savedList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = savedList.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      // Add 6 lines from here...
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}
