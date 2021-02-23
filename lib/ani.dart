import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text("Home"),
      ),
      body: Center(
          child: Text(
        "Working on this",
        style: TextStyle(fontSize: 50.0),
      )),
    );
  }
}
