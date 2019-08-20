import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/apicallwidget.dart';
import 'package:tutorial/formfieldswidget.dart';
import 'package:tutorial/gestureswidget.dart';
import 'package:tutorial/imagewidget.dart';
import 'package:tutorial/listwidget.dart';
import 'package:tutorial/orientationwidget.dart';
import 'package:tutorial/tabswidget.dart';
import 'package:tutorial/themewidget.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
          IconButton(
            icon: Icon(Icons.image),
            onPressed: _navigateLayoutTutorial,
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: FlatButton.icon(
                    icon: Icon(Icons.list),
                    label: Text('View Favourites'),
                    onPressed: () {
                      Navigator.pop(context);
                      _pushSaved();
                    }),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: FlatButton.icon(
                  icon: Icon(Icons.image),
                  label: Text('View Layout Tut. view'),
                  onPressed: () {
                    Navigator.pop(context);
                    _navigateLayoutTutorial();
                  },
                ),
              )
            ],
          ),
        ],
      ),
      body: _buildSuggestions(),
      bottomNavigationBar: Text(
        "A Footer",
        style: _biggerFont,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.pushNamed(context, "/favList", arguments: _saved);
  }

  void _navigateLayoutTutorial() {
    Navigator.pushNamed(context, '/layoutTutorial');
  }

  _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.only(top: 20),
            child: Text('Main Menu'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.live_tv),
            title: Text(
              'Call API',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ApiCallWidget.ROUTENAME);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Update UI as Orientation changes',
              style: TextStyle(color: Colors.green),
            ),
            trailing: Icon(Icons.stay_primary_portrait),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, OrientationWidget.ROUTENAME);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Dynamic Theme',
              style: TextStyle(color: Colors.orange),
            ),
            trailing: Icon(Icons.theaters),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ThemeWidget.ROUTENAME);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Tabs demo',
              style: TextStyle(color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.tab),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, TabsWidget.ROUTENAME);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Form Field validation',
              style: TextStyle(color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.tab),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, FormFieldsWidget.ROUTENAME);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Gestures tutorial',
              style: TextStyle(color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.drag_handle),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, GesturesWidget.ROUTENAME);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Images tutorial',
              style: TextStyle(color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.image),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ImageWidget.ROUTENAME);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'List tutorial',
              style: TextStyle(color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.list),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ListWidget.ROUTENAME);
            },
          )
        ],
      ),
    );
  }
}
