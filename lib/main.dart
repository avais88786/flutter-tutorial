// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:tutorial/randomwords.dart';

import 'favouriteslist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => RandomWords(),
        '/favList': (context) =>
            FavouritesList(savedList: ModalRoute.of(context).settings.arguments)
      },
      home: RandomWords(),
    );
  }
}
