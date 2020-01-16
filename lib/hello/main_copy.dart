import 'package:flutter/material.dart';

import 'list_page.dart';

/// 2019年11月20日
/// Hello Word
/// 点击事件
/// 路由、路由表、传参
/// Widget: Text Button Container Image
class HelloPage extends StatefulWidget {
  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  var text = "Hello Word";

  @override
  Widget build(BuildContext context) {
    print("initView");
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Padding(
        padding: EdgeInsets.all(6),
        child: ListView(children: <Widget>[
          Text(text),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                text = "You Click ME";
              });
            },
            child: Text("点我"),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                );
              });
            },
            child: Text("to ListPage"),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "Page2");
              });
            },
            child: Text("to Page2"),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                // 也可以用构造函数传参
                Navigator.pushNamed(context, "WidgetPage");
              });
            },
            child: Text("Widget"),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "StackPage");
              });
            },
            child: Text("Stack & Positioned 绝对定位"),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "FlexPage");
              });
            },
            child: Text("Flex & Expanded 流式布局"),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "AnimatePage");
              });
            },
            child: Text("简单动画：淡入淡出"),
          ),
        ]),
      ),
    );
  }
}

/*class _HelloPageState extends State<HelloPage>
    with SingleTickerProviderStateMixin {
  int count;
  int nextNum;
  int curNum;
  int secondsPassed;
  int millPassed;
  List<int> data = List<int>();
  AnimationController controller;
  Animation<Color> animation;
  Timer timer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    init(16);
  }

  void init(int count) {
    timer?.cancel();
    this.count = count;
    nextNum = 0;
    curNum = 0;
    secondsPassed = 0;
    millPassed = 0;
    animation = ColorTween(
      begin: Colors.white,
      end: Colors.purple,
    ).animate(controller);
    data = List.generate(count, (index) => index + 1)..shuffle();
  }

  void startTick() {
    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      ++millPassed;
      if (millPassed == 10) {
        millPassed = 0;
        ++secondsPassed;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("舒尔特方格"),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        return Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: count == 16 ? 4 : 5,
                children: List.generate(count, (index) {
                  return InkWell(
                    onTap: () async {
                      if (nextNum == 0 && (timer == null || !timer.isActive)) {
                        startTick();
                      }
                      curNum = data[index];
                      if (nextNum + 1 == curNum) {
                        ++nextNum;
                        animation = ColorTween(
                          begin: Colors.white,
                          end: Colors.purple,
                        ).animate(controller)
                          ..addListener(() {
                            setState(() {});
                          });
                      } else {
                        animation = ColorTween(
                          begin: Colors.white,
                          end: Colors.red,
                        ).animate(controller)
                          ..addListener(() {
                            setState(() {});
                          });
                      }
                      await controller.forward();
                      await controller.reverse();
                      if (nextNum == count) {
                        nextNum++;
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('恭喜'),
                        ));
                        timer.cancel();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: curNum == data[index]
                            ? animation.value
                            : Colors.white,
                      ),
                      child: Text(
                        '${data[index]}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Text('$secondsPassed.$millPassed'),
            FlatButton(
              color: Colors.blue,
              child: Text(
                '重来',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                init(count);
                setState(() {});
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text(
                '16格子',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                init(16);
                setState(() {});
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text(
                '25格子',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                init(25);
                setState(() {});
              },
            )
          ],
        );
      }),
    );
  }
}*/
