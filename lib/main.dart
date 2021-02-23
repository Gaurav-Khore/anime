import 'package:anime/ani.dart';

import 'package:flutter/material.dart';

import 'circ_ani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'circ',
      routes: {
        'circ': (context) => CircAni(),
        'home': (context) => MyHome(),
      },
    );
  }
}
