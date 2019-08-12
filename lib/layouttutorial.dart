import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutTutoralView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                Container(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.red[500]),
                      Text('850')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
