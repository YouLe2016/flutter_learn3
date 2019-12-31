import 'package:FlutterDemo/register/register_demo.dart';
import 'package:flutter/material.dart';

import 'bilibili.dart';
import 'component/main_button.dart';
import 'douyin/douyin_page.dart';
import 'hello/animate_page.dart';
import 'hello/animate_page2.dart';
import 'hello/detail_page.dart';
import 'hello/flex_page.dart';
import 'hello/list_page.dart';
import 'hello/main_copy.dart';
import 'hello/page2.dart';
import 'hello/stack_page.dart';
import 'hello/widget_page.dart';
import 'setfg/setfg_page.dart';
import 'widget/tabbar_widget.dart';
import 'zhihu/zhihu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
//      initialRoute: "douyin",
      routes: {
        '/regiter_page': (context) => RegisterDemo(),

        // 三天学会flutter
        'BiliBli': (context) => BiliBiliPage(),

        // hello
        'HelloPage': (context) => HelloPage(),
        'ListPage': (context) => ListPage(),
        'Page2': (context) => Page2(),
        'DetailPage': (context) => DetailPage(),
        'WidgetPage': (context) => WidgetPage(),
        'StackPage': (context) => StackPage(),
        'FlexPage': (context) => FlexPage(),
        'AnimatePage': (context) => AnimatePage(),
        'AnimatePage2': (context) => AnimatePage2(),

        // widget
        'TabBarWidget': (context) => TabBarPage(),

        // 马友发
        'ZhihuPage': (context) => ZhiHuPage(),
        'setfg': (context) => Setfg(),
        'douyin': (context) => DouYinPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(6),
        child: ListView(
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "HelloPage");
              },
              child: Text("Hello "),
            ),
            MainButton(text: "RegisterDemo", routeName: "/regiter_page"),
            MainButton(text: "TabBar ", routeName: "TabBarWidget"),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => Navigator.pushNamed(context, "BiliBli"),
              child: Text("B站"),
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => Navigator.pushNamed(context, "ZhihuPage"),
              child: Text("某乎"),
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => Navigator.pushNamed(context, "setfg"),
              child: Text("舒尔特方格"),
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => Navigator.pushNamed(context, "douyin"),
              child: Text("某音"),
            ),
          ],
        ),
      ),
    );
  }
}
