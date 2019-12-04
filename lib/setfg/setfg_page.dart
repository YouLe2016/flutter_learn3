import 'package:FlutterDemo/setfg/setfg_provider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setfg extends StatelessWidget {
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
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Expanded(
//                  flex: 6,
//                  child: Container(
//                    padding: EdgeInsets.all(1),
//                    color: Colors.black,
//                    child: GridWidget(),
//                  ),
//                ),
//                Expanded(
//                  child: CountDownWidget(),
//                  flex: 4,
//                ),
                Container(
                  padding: EdgeInsets.all(1),
                  color: Colors.black,
                  child: GridWidget(),
                ),
                SizedBox(height: 16),
                CountDownWidget(),
              ],
            )),
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
  int _curIndex = -1;

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
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      shrinkWrap: true,
      crossAxisCount: provider.size,
      children: List.generate(provider.data.length, (index) {
        return InkWell(
          onTap: () {
            _curIndex = index;
            provider.startTimer();
            if (provider.data[_curIndex] == provider.curNum) {
              _currentAnimation = _animation;
              if (provider.curNum++ == 16) {
                provider.stopTimer();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("恭喜过关"),
                    action: SnackBarAction(label: '知道啦', onPressed: () {}),
                  ),
                );
              }
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
//              border: Border.all(color: Colors.black),
              color:
                  _curIndex == index ? _currentAnimation.value : Colors.white,
            ),
          ),
        );
      }),
    );
  }
}

class CountDownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SetfgProvider>(context);
    return Column(
      children: <Widget>[
        Text(provider.totalTime.toStringAsFixed(1)),
        RaisedButton(
          onPressed: () => provider.restart(),
          child: Text('重置'),
        ),
        RaisedButton(
          onPressed: () => provider.start(4),
          child: Text('16格子'),
        ),
        RaisedButton(
          onPressed: () => provider.start(5),
          child: Text('25格子'),
        ),
      ],
    );
  }
}

// 单向变色的容器
// AnimatedContainer
