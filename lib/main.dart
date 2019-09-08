import 'package:TestDemo/constant.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowCheckedModeBanner: false,
      title: 'Test Demo',
      theme: ThemeData(
//        primaryColor: Colors.pinkAccent,
          ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pinkAccent,
//          leading: Icon(Icons.arrow_back),
          title: Row(children: <Widget>[
            ClipOval(child: Image.network(imgHeader, width: 32, height: 32)),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.search),
              ),
            ),
            Icon(Icons.videogame_asset),
            SizedBox(width: 20),
            Icon(Icons.cloud_download),
            SizedBox(width: 20),
            Icon(Icons.message),
          ]),
        ),
        body: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text("直播"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.pink)),
                  ),
                ),
                Container(
                  child: Text("推荐"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                Container(
                  child: Text("追番"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                Container(
                  child: Text("国家宝藏"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                Container(
                  child: Text("故事王"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imgBanner_local),
                )),
            GridView.count(
              //水平子Widget之间间距
              crossAxisSpacing: 0,
              //垂直子Widget之间间距
              mainAxisSpacing: 10.0,
              //GridView内边距
              padding: EdgeInsets.all(16.0),
              //一行的Widget数量
              crossAxisCount: 5,
              //子Widget宽高比例
              childAspectRatio: 1.0,
              shrinkWrap: true,
              //子Widget列表
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment),
                    Text("英雄联盟"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment_ind),
                    Text("绝地求生"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment_late),
                    Text("视频聊天"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment_return),
                    Text("第五人格"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment_return),
                    Text("全部标签"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment),
                    Text("英雄联盟"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment_ind),
                    Text("绝地求生"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment_late),
                    Text("视频聊天"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment_return),
                    Text("第五人格"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.assignment_return),
                    Text("全部标签"),
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.black12,
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: <Widget>[
                  Text("我的关注"),
                  SizedBox(width: 8),
                  Text("16小时前", style: TextStyle(color: Colors.black26)),
                  SizedBox(width: 8),
                  Text("江心才子"),
                  Text("直播了唱见台", style: TextStyle(color: Colors.black26)),
                  Flexible(child: Container(), flex: 1),
                  Icon(Icons.keyboard_arrow_right, color: Colors.black26)
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: <Widget>[
                  Text("推荐直播"),
                  Flexible(child: Container(), flex: 1),
                  Text("换一换", style: TextStyle(color: Colors.black26)),
                  Icon(Icons.refresh, size: 16, color: Colors.black26)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
