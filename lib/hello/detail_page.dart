import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("DetailPage"),
      ),
      body: ListTile(
        title: Text(args["title"], style: TextStyle(fontSize: 18.0)),
        subtitle: Text(args["subtitle"]),
        leading: Icon(Icons.fastfood, color: Colors.orange),
      ),
    );
  }
}
