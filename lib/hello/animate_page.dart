import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatePage extends StatefulWidget {
  @override
  _AnimateState createState() => _AnimateState();
}

class _AnimateState extends State<AnimatePage> {
  var _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animate Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Icon(
                  Icons.mood,
                  size: 46,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                child: Text('显示隐藏'),
              ),
            ],
          ),
        ));
  }
}
