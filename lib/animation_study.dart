import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(AnimationApp());

class AnimationApp extends StatefulWidget {
  @override
  _AnimationAppState createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _tween;
  Animation<Color> _colorTween;
  Animation<double> _curveTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _curveTween =
        CurveTween(curve: Curves.linear).animate(_animationController);
    _curveTween.addListener(() {
      setState(() {
        debugPrint('value = ${_curveTween.value}');
      });
    });

//    _tween = Tween(begin: 50.0, end: 200.0).animate(_animationController);
//    _tween.addListener(() {
//      setState(() {
//        debugPrint('value = ${_tween.value}');
//      });
//    });

    _colorTween = ColorTween(begin: Colors.red, end: Colors.purple)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimationStudy'),
        ),
        body: Center(
          child: Container(
            width: 50 + _curveTween.value * 250,
            height: 50 + _curveTween.value * 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _colorTween.value,
            ),
          ),
        ),
      ),
    );
  }
}
