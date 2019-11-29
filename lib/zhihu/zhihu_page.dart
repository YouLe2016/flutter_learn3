import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZhiHuPage extends StatefulWidget {
  @override
  _ZhiHuPageState createState() => _ZhiHuPageState();
}

class _ZhiHuPageState extends State<ZhiHuPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "第一批90后马上就30了",
              icon: Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_comment), onPressed: () {})
        ],
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          unselectedLabelStyle: TextStyle(fontSize: 14),
          tabs: <Widget>[
            Tab(text: '页面一'),
            Tab(text: '页面二'),
            Tab(text: '页面三'),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        _generateContentList(),
        Text('页面二'),
        Text('页面三'),
      ]),
    );
  }
}

Widget _generateContentList() {
  final list = List.generate(20, (index) {
    return Content();
  });

  return ListView.separated(
    itemCount: list.length,
    separatorBuilder: (context, index) => SizedBox(height: 4),
    itemBuilder: (BuildContext context, int index) {
      final item = list[index];
      return Card(
        child: Padding(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                item.title,
                style: new TextStyle(
                    fontSize: 16.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"),
              ),
              SizedBox(height: 8),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(item.avatarUrl),
                    radius: 12,
                  ),
                  SizedBox(width: 8),
                  Text(
                    item.nickname,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.description,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(item.subtitle),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Text('111点赞 222评论'),
                  Spacer(),
                  Icon(Icons.more_horiz),
                ],
              )
            ],
          ),
          padding: const EdgeInsets.all(16.0),
        ),
      );
    },
  );
}

class Content {
  String title;
  String subtitle;
  String avatarUrl;
  String nickname;
  String description;

  Content() {
    title = "男生 25 岁了，应该明白哪些道理？";
    subtitle =
        "毕业三年，还有一个月满25岁 上海，月薪1W 房子车子，不知道啥时候买得起 大学谈了一次恋爱，毕业分手，一直单身到现在 到30岁，还有五年 关于事业和爱情，希…";
    avatarUrl =
        "https://pic2.zhimg.com/d6908f8ccc66e6e0b5be4e99e52c8c36_xl.jpg";
    nickname = "乐哥哥";
    description = "职场萌新";
  }
}
