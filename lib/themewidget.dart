import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeWidget extends StatefulWidget {
  static const String ROUTENAME = '/themewidget';

  @override
  State<StatefulWidget> createState() {
    return ThemeWidgetState();
  }
}

class ThemeWidgetState extends State<ThemeWidget> {
  bool lightTheme = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme ? ThemeData.light() : ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dynamic Theming"),
        ),
        body: Center(
          child: Container(
            child: Text(
              'Center Text...',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(50),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cached),
          onPressed: () {
            setState(() {
              lightTheme = !lightTheme;
            });
          },
        ),
      ),
    );
  }
}
