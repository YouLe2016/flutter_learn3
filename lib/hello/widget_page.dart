import 'package:FlutterDemo/widget/edit_widget.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(6),
        child: ListView(
          children: <Widget>[
            Text('text'),
            Text(
              "Hello world",
              style: new TextStyle(
                  fontSize: 50.0,
                  color: const Color(0xFF085af0),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
            Divider(),
            Text('TextField'),
            EditWidget(),
            Divider(),
            Text('button'),
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("我是 RaiseButton"),
                  onPressed: () {},
                ),
                FlatButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text("我是 FlatButton"),
                ),
                OutlineButton(
                  onPressed: () {},
                  child: Text("我是 OutlineButton"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                )
              ],
            ),
            Divider(),
            Text('Container'),
            Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "我是 Container",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
            Divider(),
            Text('Image'),
            Column(
              children: <Widget>[
                Image.network(
                  "https://mat1.gtimg.com/pingjs/ext2020/qqindex2018/dist/img/qq_logo_2x.png",
                  width: 200,
                ),
                Text('AssetImage'),
                Text('MemoryImage'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
