import 'package:flutter/material.dart';

/// Animation: 保存动画的值和状态
/// AnimationController: 控制动画，包含：启动forward()、停止stop()、反向播放reverse()等方法
/// Tween: 提供begin，end作为动画变化的取值范围
/// Curve：设置动画使用曲线变化，如非匀速动画，先加速，后减速等的设定。
class AnimatePage2 extends StatefulWidget {
  @override
  _AnimatePage2State createState() => _AnimatePage2State();
}

class _AnimatePage2State extends State<AnimatePage2>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 300.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn))
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Page'),
      ),
      body: Center(
        child: Icon(Icons.all_inclusive, size: _animation.value),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
