import 'package:flutter/material.dart';

class AnimatePositiveIcon extends StatefulWidget {
  final double size;
  final Color startColor;
  final Color endColor;

  AnimatePositiveIcon(this.size, {this.startColor, this.endColor});

  @override
  _AnimatePositiveIconState createState() => _AnimatePositiveIconState();
}

class _AnimatePositiveIconState extends State<AnimatePositiveIcon>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Color _color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
      reverseDuration: Duration(milliseconds: 250),
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
        reverseCurve: Curves.easeInBack,
      ),
    )..addListener(() {
        print("vaule1 = ${_animation.value}");
        setState(() {});
      });
    _color = widget.startColor;
    _refreshUi();
  }

  void _refreshUi() {
    _controller.forward().then((value) {
      _color = widget.endColor;
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      size: _animation.value * widget.size,
      color: _color,
    );
  }
}

class AnimateNegativeIcon extends StatefulWidget {
  final double size;
  final Color startColor;
  final Color endColor;
  final VoidCallback callback;

  AnimateNegativeIcon(this.size,
      {@required this.startColor, this.endColor, this.callback});

  @override
  _AnimateNegativeIconState createState() => _AnimateNegativeIconState();
}

class _AnimateNegativeIconState extends State<AnimateNegativeIcon>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  Color _color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _color = widget.endColor ?? widget.startColor;
          widget.callback();
        }
      })
      ..addListener(() {
        print("vaule2 = ${_animation.value}");
        setState(() {});
      });
    _color = widget.startColor;
    _refreshUi();
  }

  void _refreshUi() {
    _controller.forward().then((value) {
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      size: _animation.value * widget.size,
      color: _color,
    );
  }
}
