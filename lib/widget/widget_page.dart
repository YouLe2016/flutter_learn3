import 'package:FlutterDemo/component/main_button.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            MainButton(text: "AlignWidget", routeName: "/align_widget"),
            MainButton(text: "Padding", routeName: "/padding_widget"),
            MainButton(text: "ConstrainedBox", routeName: "/constrained_box_widget"),
            MainButton(text: "DecoratedBox", routeName: "/decorated_box_widget"),
          ],
        ),
      ),
    );
  }
}
