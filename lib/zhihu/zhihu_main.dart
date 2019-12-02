import 'package:FlutterDemo/provide/provider_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ZhiHuApp());

class ZhiHuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: ZhiHuPage(),
      title: "某乎",
      home: ProviderPage(),
    );
  }
}
