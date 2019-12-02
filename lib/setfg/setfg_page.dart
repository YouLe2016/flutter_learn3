import 'package:FlutterDemo/setfg/setfg_provider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetfgWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('舒尔特方格'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SetfgProvider(4))
        ],
        child: Padding(
          padding: EdgeInsets.all(8),
          child: GridWidget(),
        ),
      ),
    );
  }
}

class GridWidget extends StatefulWidget {
  @override
  _GridWidgetState createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<Color> _animation;
  Animation<Color> _animation2;

  Animation<Color> _currentAnimation;
  int curNum = -1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    _animation = ColorTween(begin: Colors.white, end: Colors.purpleAccent)
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _animation2 = ColorTween(begin: Colors.white, end: Colors.redAccent)
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _currentAnimation = _animation;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SetfgProvider>(context);
    return GridView.count(
      crossAxisCount: provider.size,
      children: List.generate(provider.data.length, (index) {
        return InkWell(
          onTap: () {
            curNum = provider.data[index];
            if (curNum == provider.curNum) {
              _currentAnimation = _animation;
              provider.curNum++;
            } else {
              _currentAnimation = _animation2;
            }
            _controller.forward().then((value) => _controller.reverse());
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              provider.data[index].toString(),
              style: TextStyle(fontSize: 18),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
//              color: clickColor(index),
              color: curNum == provider.data[index]
                  ? _currentAnimation.value
                  : Colors.white,
            ),
          ),
        );
      }),
    );
  }
}

// 单向变色的容器
// AnimatedContainer
