import 'package:FlutterDemo/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import 'animate_positive_icon.dart';
import 'bottom_sheet.dart';
import 'recommend_provider.dart';

class DouYinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Home(),
        decoration: BoxDecoration(color: Colors.black),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getBottomTextWidget('同城', true),
              getBottomTextWidget('首页', false),
              AddIcon(),
              getBottomTextWidget('消息', false),
              getBottomTextWidget('我', false),
            ],
          ),
        ),
      ),
    );
  }
}

getBottomTextWidget(String content, bool isSelected) {
  return Text(
    '$content',
    style: isSelected
        ? TextStyle(fontSize: 18, color: Colors.white)
        : TextStyle(fontSize: 14, color: Colors.grey[400]),
  );
}

class AddIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            height: 35,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.cyan,
              ),
            ),
          ),
          Positioned(
            height: 35,
            right: 0,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent,
              ),
            ),
          ),
          Positioned(
            height: 35,
            right: 2,
            width: 56,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 如何获取屏幕宽度?
    // 必须在MaterialApp的下面一层获取
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecommendProvider()),
      ],
      child: Stack(
//      alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            height: screenHeight,
            child: Image.network(
              "https://ws1.sinaimg.cn/large/0065oQSqly1fuh5fsvlqcj30sg10onjk.jpg",
            ),
          ),
          Positioned(
            top: 0,
            height: 96,
            width: screenWidth,
            child: TopBar(),
          ),
          Positioned(
            bottom: 0,
            width: screenWidth * 0.7,
            height: 150,
            child: getBottomContent(),
          ),
          Positioned(
            right: 0,
            top: screenHeight * 0.3,
            width: screenWidth * 0.25,
            height: screenHeight * 0.4,
            child: ButtonList(),
          ),
          Positioned(
            right: 16,
            bottom: 32,
            child: RotateAlbum(),
          ),
        ],
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    RecommendProvider provider = Provider.of<RecommendProvider>(context);

    double iconSize = 55 * rpx;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: 60,
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(imgHeader),
                radius: 24,
              ),
              Positioned(
                bottom: 0,
                left: 14,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.add, size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          padding: EdgeInsets.all(0),
          iconSize: iconSize,
          icon: IconText(
            icon: provider.mainInfo.ifFaved
                ? AnimatePositiveIcon(
                    iconSize,
                    startColor: Colors.grey[100],
                    endColor: Colors.red,
                  )
                : AnimateNegativeIcon(
                    iconSize,
                    startColor: Colors.red,
                    endColor: Colors.grey[100],
                  ),
            text: provider.mainInfo.favCount.toString(),
          ),
          onPressed: () {
            provider.tapFav();
          },
        ),
        InkWell(
          child: IconText(
              icon: Icon(Icons.feedback, size: iconSize, color: Colors.white),
              text: "999k"),
          onTap: () {
            showBottomSheet(context);
          },
        ),
        IconText(
            icon: Icon(Icons.reply, size: iconSize, color: Colors.white),
            text: "999k"),
      ],
    );
  }
}

class IconText extends StatelessWidget {
  final Widget icon;
  final String text;

  const IconText({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        icon,
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class RotateAlbum extends StatefulWidget {
  @override
  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  RotationTransition _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animation = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: CircleAvatar(
        backgroundImage: NetworkImage(imgHeader),
        radius: 32,
      ),
    );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return _animation;
  }
}

showBottomSheet(BuildContext context) {
  print('sssss');
  // 底部弹框的方法
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      builder: (context) => ReplyFull());
}

getBottomContent() {
  return Column(
    children: <Widget>[
      ListTile(
        title: Text("@人民日报", style: TextStyle(color: Colors.white)),
        subtitle: Text(
          '放大森但撒狂风大放多法减肥塞阀发的拆哦大浮动啊放大森懂啊房东爱抚懂啊',
          maxLines: 3,
          style: TextStyle(color: Colors.white),
        ),
      ),
      Container(
        width: 210,
        height: 30,
        child: Marquee(
          text: "大反派积分卡三翻叮安排三房开怕三发碟哦撒就分开拍撒娇佛牌撒进房戳牌萨基佛牌囧啊",
          style: TextStyle(color: Colors.white),
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ),
    ],
  );
}

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.white),
          iconSize: 30,
        ),
        Expanded(
          child: Center(
            child: TabBar(
              labelStyle: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
//                indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
              controller: _tabController,
              tabs: <Widget>[
//                Text('关注'),
//                Text('推荐'),
                Tab(text: '关注'),
                Tab(text: '推荐'),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.live_tv, color: Colors.white),
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
