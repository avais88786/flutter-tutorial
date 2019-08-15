import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'favouritewidget.dart';
import 'informationwidget.dart';

class LayoutTutoralView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    //Future<ByteData> x = DefaultAssetBundle.of(context).load("key");
    
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.asset('assets/inverness.png'),
          Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Inverness Lake',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            'Somewhere in Inverness, Scotland',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          )
                        ],
                      ),
                    ),
                    FavouriteWidget()
                  ])),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton(color, Icons.call, 'Call'),
                _buildButton(color, Icons.near_me, 'Route'),
                _buildButton(color, Icons.share, 'Share')
              ],
            ),
          ),
          InformationWidgetParent()
        ],
      ),
    );
  }

  Widget _buildButton(Color color, IconData icon, String label) {
    if (label.toLowerCase() == 'route') {
      return Column(
        children: <Widget>[
          IconButton(
            icon: Icon(icon, color: color),
            onPressed: _openMaps,
          ),
          Text(label),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Icon(icon, color: color),
          Text(label),
        ],
      );
    }
  }

  void _openMaps() async {
    const url = 'https://www.google.com/maps/search/?api=1&query=inverness';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
