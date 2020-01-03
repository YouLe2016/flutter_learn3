import 'package:flutter/material.dart';

/// 1. ConstrainedBox: 约束盒子
///   BoxConstraints: 盒子约束
///       minWidth = 0.0,
///       maxWidth = double.infinity,
///       minHeight = 0.0,
///       maxHeight = double.infinity,
///       BoxConstraints.tight: 紧: 相当于android:MeasureSpec.EXACTLY 准确
///       BoxConstraints.loose: 疏松: 相当于android:MeasureSpec.AT_MOST 最大值
///       BoxConstraints.expand: 扩展: 相当于android:MeasureSpec.UNSPECIFIED 不指定大小
/// 2. SizedBox
///   等价于ConstrainedBox(constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0))
class ConstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var redbox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox'),
      ),
      body: Column(
//        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 50,
            ),
            child: redbox,
          ),
          Container(
            color: Colors.pink,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
