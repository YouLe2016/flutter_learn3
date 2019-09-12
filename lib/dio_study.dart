import 'dart:convert';

import 'package:TestDemo/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioApp extends StatefulWidget {
  @override
  _DioAppState createState() => _DioAppState();
}

class _DioAppState extends State<DioApp> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  String _content = "123";

  void loadData() async {
    var dio = Dio();
    var response = await dio.get(url);
    var categories = response.data['category'];
    String data = "";
    categories.forEach((it) => data += '$it\n');
    setState(() => _content = data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(_content),
        ),
      ),
    );
  }
}
