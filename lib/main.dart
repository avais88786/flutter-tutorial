// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:tutorial/apicallwidget.dart';
import 'package:tutorial/formfieldswidget.dart';
import 'package:tutorial/gestureswidget.dart';
import 'package:tutorial/imagewidget.dart';
import 'package:tutorial/listwidget.dart';
import 'package:tutorial/orientationwidget.dart';
import 'package:tutorial/randomwords.dart';
import 'package:tutorial/tabswidget.dart';
import 'package:tutorial/themewidget.dart';

import 'favouriteslist.dart';
import 'layouttutorial.dart';
import 'dart:async';

//final SentryClient _sentry = SentryClient(dsn: "App DSN goes Here");

Future<Null> main() async {
// This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Sentry.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    await reportError(error, stackTrace);
  });
}

//void main() => runApp(MyApp());

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
        FormFieldsWidget.ROUTENAME: (context) => FormFieldsWidget(),
        ApiCallWidget.ROUTENAME: (context) => ApiCallWidget(),
        GesturesWidget.ROUTENAME: (context) => GesturesWidget(),
        ImageWidget.ROUTENAME: (context) => ImageWidget(),
        ListWidget.ROUTENAME: (context) => ListWidget()
      },
      //home: RandomWords(),
    );
  }
}

bool get isInDebugMode {
  bool inDebugMode = false;

// Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDebugMode = true);

  return inDebugMode;
}

Future<Null> reportError(dynamic error, dynamic stackTrace) async {
  if (isInDebugMode) {
    print(stackTrace);
    print('In dev mode. Not sending report to Sentry.io.');
    return;
  }

  //print('Reporting to Sentry.io...');

  // final SentryResponse response = await _sentry.captureException(
  //   exception: error,
  //   stackTrace: stackTrace,
  // );

  if (5 == 5) {
    //response.isSuccessful
    print('Reported Success!');
  } else {
    print('Failed to report to Sentry.io:');
  }
}
