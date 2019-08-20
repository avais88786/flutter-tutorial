import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageWidget extends StatelessWidget {
  static const String ROUTENAME = '/imagewidget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Working with Images'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Scrollable(
          viewportBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Image.network('https://picsum.photos/250?image=9'),
                Divider(),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://picsum.photos/250?image=9',
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
