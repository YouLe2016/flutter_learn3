import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StackPage"),
      ),
      body: Stack(
        children: <Widget>[
          Container(),
          Positioned(
            child: Icon(Icons.accessible_forward, size: 46),
            top: 16,
            right: 16,
          ),
        ],
      ),
    );
  }
}
