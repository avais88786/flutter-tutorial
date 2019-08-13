import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavouritesWidgetState();
  }
}

class FavouritesWidgetState extends State<FavouriteWidget> {
  bool _isFavourite = true;
  int _favCount = 85;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: (_isFavourite ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red,
            onPressed: _toggleFavourite,
          ),
          Text(_favCount.toString())
        ],
      ),
    );
  }

  _toggleFavourite() {
    setState(() {
    if (_isFavourite) {
      _isFavourite = false;
      _favCount = _favCount - 1;
    } else {
      _isFavourite = true;
      _favCount = _favCount + 1;
    }  
    });
    
  }
}
