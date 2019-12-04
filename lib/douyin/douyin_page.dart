import 'package:flutter/material.dart';

class DouYinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Home(),
        decoration: BoxDecoration(color: Colors.yellowAccent),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('同城', style: TextStyle(color: Colors.white)),
              Text('首页', style: TextStyle(color: Colors.white)),
              Text('消息', style: TextStyle(color: Colors.white)),
              Text('我', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
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
    return Stack(
      children: <Widget>[
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
          child: Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          width: screenWidth * 0.25,
          height: screenHeight * 0.5,
          child: Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
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
    return Container(
      decoration: BoxDecoration(color: Colors.pinkAccent),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
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
            icon: Icon(Icons.live_tv),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
