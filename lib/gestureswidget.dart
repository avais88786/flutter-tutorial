import 'package:flutter/material.dart';

class GesturesWidget extends StatelessWidget {
  static const String ROUTENAME = '/gestureswidget';
  final List<String> items = List.generate(5, (index) => 'Item$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getures Demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Builder(
              builder: (context2) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context2).showSnackBar(SnackBar(
                      content: Text('Inkwell Tap'),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Inkwell Tap Flat Button'),
                  ),
                );
              },
            ),
            Builder(
              builder: (context2) {
                return GestureDetector(
                  // When the child is tapped, show a snackbar.
                  onTap: () {
                    final snackBar = SnackBar(content: Text("Gesture Tap"));

                    Scaffold.of(context2).showSnackBar(snackBar);
                  },
                  // The custom button
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context2).buttonColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text('Gesture Detector Button'),
                  ),
                );
              },
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context2, index) {
                var item = items[index];

                return Dismissible(
                  key: Key(item),
                  direction: DismissDirection.up,
                  onDismissed: (direction) {
                    Scaffold.of(context2).showSnackBar(SnackBar(
                      content: Text('Item Dismissed $item'),
                    ));
                  },
                  background: Container(
                    color: Colors.red,
                  ),
                  child: ListTile(
                    title: Text('Item $item'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
