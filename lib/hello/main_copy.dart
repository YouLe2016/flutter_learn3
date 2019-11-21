import 'package:TestDemo/hello/stack_page.dart';
import 'package:TestDemo/hello/widget_page.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'flex_page.dart';
import 'list_page.dart';
import 'page2.dart';

void main() => runApp(MyApp());

/// 2019年11月20日
/// Hello Word
/// 点击事件
/// 路由、路由表、传参
/// Widget: Text Button Container Image
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(),
      initialRoute: "HomePage",
      routes: {
        'HomePage': (context) => MyHomePage(),
        'ListPage': (context) => ListPage(),
        'Page2': (context) => Page2(),
        'DetailPage': (context) => DetailPage(),
        'WidgetPage': (context) => WidgetPage(),
        'StackPage': (context) => StackPage(),
        'FlexPage': (context) => FlexPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = "Hello Word";

  @override
  Widget build(BuildContext context) {
    print("initView");
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
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
        ]),
      ),
    );
  }
}

/*class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Text("Hello Word"),
      ),
    );
  }
}*/
