import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex Page"),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            color: Colors.blue,
            width: 30,
            height: 100,
          ),Expanded(
            flex: 1,
            child: Container(
              height: 100.0,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
