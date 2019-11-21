import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex Page"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Text('Hello word'),
        ],
      ),
    );
  }
}
