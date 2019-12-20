import 'package:flutter/material.dart';

class AnimatePositiveIcon extends StatefulWidget {
  @override
  _AnimatePositiveIconState createState() => _AnimatePositiveIconState();
}

class _AnimatePositiveIconState extends State<AnimatePositiveIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = CurveTween(curve: null).animate(_controller)
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
