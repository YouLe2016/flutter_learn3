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
              fit: FlexFit.loose,
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
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text("直播"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.pink))),
                ),
                Container(
                  child: Text("推荐"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.pink))),
                ),
                Container(
                  child: Text("追番"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.pink))),
                ),
                Container(
                  child: Text("国家宝藏"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.pink))),
                ),
                Container(
                  child: Text("故事王"),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.pink))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
