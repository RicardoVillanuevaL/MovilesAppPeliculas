import 'dart:async';

import 'package:flutter/material.dart';



/// Sqflite test app
class SqlitePage extends StatefulWidget {
  /// test app.
  const SqlitePage({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  _SqlitePageState createState() => _SqlitePageState();
}

/// Simple test page.
const String testRawRoute = '/test/simple';

/// Open test page.
const String testOpenRoute = '/test/open';

/// Slow test page.
const String testSlowRoute = '/test/slow';

/// Type test page.
const String testTypeRoute = '/test/type';

/// Batch test page.
const String testBatchRoute = '/test/batch';

/// `todo` example test page.
const String testTodoRoute = '/test/todo';

/// Exception test page.
const String testExceptionRoute = '/test/exception';

/// Manual test page.
const String testManualRoute = '/test/manual';

/// Experiment test page.
const String testExpRoute = '/test/exp';

/// Deprecated test page.
const String testDeprecatedRoute = '/test/deprecated';

class _SqlitePageState extends State<SqlitePage> {
  var routes = <String, WidgetBuilder>{
    '/test': (BuildContext context) => MyHomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sqflite Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with 'flutter run'. You'll see
          // the application has a blue toolbar. Then, without quitting
          // the app, try changing the primarySwatch below to Colors.green
          // and then invoke 'hot reload' (press 'r' in the console where
          // you ran 'flutter run', or press Run > Hot Reload App in IntelliJ).
          // Notice that the counter didn't reset back to zero -- the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Sqflite Demo Home Page'),
        routes: routes);
  }
}

/// App home menu page.
class MyHomePage extends StatefulWidget {
  /// App home menu page.
  MyHomePage({Key? key, this.title}) : super(key: key) {
  }

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String? _debugAutoStartRouteName;

/// (debug) set the route to start with.
String? get debugAutoStartRouteName => _debugAutoStartRouteName;

/// Deprecated to avoid calls
@Deprecated('Deb only')
set debugAutoStartRouteName(String? routeName) =>
    _debugAutoStartRouteName = routeName;

class _MyHomePageState extends State<MyHomePage> {
  int get _itemCount => 12;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((_) async {
      if (mounted) {
        // Use it to auto start a test page
        if (debugAutoStartRouteName != null) {
          // only once

          // await Navigator.of(context).pushNamed(testExpRoute);
          // await Navigator.of(context).pushNamed(testRawRoute);
          final future =
              Navigator.of(context).pushNamed(debugAutoStartRouteName!);
          // ignore: deprecated_member_use_from_same_package
          debugAutoStartRouteName = null;
          await future;
          // await Navigator.of(context).pushNamed(testExceptionRoute);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Sqflite demo', textAlign: TextAlign.center)),
        ),
        body:
            ListView.builder(itemBuilder: _itemBuilder, itemCount: _itemCount));
  }

  //new Center(child: new Text('Running on: $_platformVersion\n')),

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile();
  }
}