// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:tutorial/formfieldswidget.dart';
import 'package:tutorial/orientationwidget.dart';
import 'package:tutorial/randomwords.dart';
import 'package:tutorial/tabswidget.dart';
import 'package:tutorial/themewidget.dart';

import 'favouriteslist.dart';
import 'layouttutorial.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => RandomWords(),
        '/favList': (context) => FavouritesList(
            savedList: ModalRoute.of(context).settings.arguments),
        '/layoutTutorial': (context) => LayoutTutoralView(),
        OrientationWidget.ROUTENAME: (context) => OrientationWidget(),
        ThemeWidget.ROUTENAME: (context) => ThemeWidget(),
        TabsWidget.ROUTENAME: (context) => TabsWidget(),
        FormFieldsWidget.ROUTENAME: (context) => FormFieldsWidget()
      },
      //home: RandomWords(),
    );
  }
}
