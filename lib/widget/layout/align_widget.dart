import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align'),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Align(
          widthFactor: 2,
          heightFactor: 2,
//          alignment: Alignment.topRight,
//          alignment: Alignment(2,0), // 矩形的中心点作为坐标原点
          alignment: FractionalOffset(1.5, 0.5), // 坐标原点为矩形的左侧顶点
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}

class _Example1 extends StatelessWidget {
  const _Example1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      color: Colors.blue[50],
      child: Align(
        alignment: Alignment.topRight,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}
