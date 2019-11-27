import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
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
        title: Text("TabBarWidget"),
        bottom: TabBar(
          controller: _tabController,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 12),
          indicatorColor: Colors.pinkAccent,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.music_note), text: "page1"),
            Tab(text: "page2"),
            Tab(text: "page3"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text("page1", style: TextStyle(fontSize: 40)),
          Text("page2", style: TextStyle(fontSize: 40)),
          Text("page3", style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
