import 'package:flutter/material.dart';

/// DecoratedBox: 装饰盒子
///   Decoration: 装饰
///     BoxDecoration: 盒子装饰
///
class DecoratedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DecoratedBox'),
      ),
      body: Center(
//        scrollDirection: Axis.horizontal,
        child: DecoratedBox(
          decoration: BoxDecoration(
            //背景渐变
            gradient: LinearGradient(
              colors: [Colors.red, Colors.orange[700]],
            ),
//          color: Colors.pink,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2, 2),
                blurRadius: 4.0,
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
