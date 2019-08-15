import 'package:flutter/material.dart';

class OrientationWidget extends StatelessWidget {
  static const String ROUTENAME = '/orientationwidget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.phone_android),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(100, (index) {
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.undo),
      ),
    );
  }
}
