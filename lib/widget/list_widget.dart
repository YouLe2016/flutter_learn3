import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ListApp());

class ListApp extends StatefulWidget {
  @override
  _ListAppState createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  bool appbarVisible = false;
  double downY;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListViewWidget',
      home: Scaffold(
          appBar: appbarVisible
              ? AppBar(
                  title: Text('ListViewWidget'),
                )
              : null,
          body: Listener(
            onPointerDown: (event) {
//              debugPrint('size = ${event.size}');
//              var position = event.position;
//              debugPrint('onPointerDown: x=${position.dx}, y=${position.dy}');
              downY = event.position.dy;
            },
            onPointerMove: (event) {
//              debugPrint('size = ${event.size}');
//              var position = event.position;
//              debugPrint('onPointerMove: x=${position.dx}, y=${position.dy}');
              if ((event.position.dy - downY).abs() < 60) return;
              if (event.position.dy < downY) {
                debugPrint('向上滑动');
                setState(() {
                  appbarVisible = false;
                });
              } else {
                debugPrint('向下滑动');
                setState(() {
                  appbarVisible = true;
                });
              }
            },
            child: ListView(
              scrollDirection: Axis.vertical,
              reverse: false,
              controller: ScrollController(
                initialScrollOffset: 120,
              ),
              children: <Widget>[
                Container(color: Colors.red, height: 100, width: 100),
                Container(color: Colors.orange, height: 100, width: 100),
                Container(color: Colors.yellow, height: 100, width: 100),
                Container(color: Colors.green, height: 100, width: 100),
                Container(color: Colors.cyan, height: 100, width: 100),
                Container(color: Colors.blue, height: 100, width: 100),
                Container(color: Colors.purple, height: 100, width: 100),
                Container(color: Colors.red, height: 100, width: 100),
                Container(color: Colors.orange, height: 100, width: 100),
                Container(color: Colors.yellow, height: 100, width: 100),
                Container(color: Colors.green, height: 100, width: 100),
                Container(color: Colors.cyan, height: 100, width: 100),
                Container(color: Colors.blue, height: 100, width: 100),
                Container(color: Colors.purple, height: 100, width: 100),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Text("ListView.builder $index");
                    })
              ],
            ),
          )),
    );
  }
}
