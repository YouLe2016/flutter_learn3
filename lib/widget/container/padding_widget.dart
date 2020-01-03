import 'package:flutter/material.dart';

/// Padding
/// 作用: 可以给其子节点添加填充（留白），和边距效果类似。
///
/// 一个需要学习的类:
/// EdgeInsetsGeometry: 边缘嵌入几何
///   EdgeInsets: 边缘嵌入
///     symmetric({ vertical, horizontal })：对称方向
///     all(double value) : 所有方向
///     only({left, top, right ,bottom })：具体某个方向
///     fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向
class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 8),
              color: Colors.pink,
              child: Text("Hello world"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.orange,
              child: Text("I am Jack"),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.cyan,
              child: Text("Your friend"),
            ),
          ],
        ),
      ),
    );
  }
}
