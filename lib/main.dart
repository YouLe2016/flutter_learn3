import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Icon(Icons.arrow_back),
              Icon(Icons.arrow_back),
            ],
          ),
        ),
      ),
    );
  }
}
