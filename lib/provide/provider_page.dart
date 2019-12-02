import 'package:FlutterDemo/provide/myprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provide Demo"),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MyProvide()),
        ],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyButton("+"),
              // 这样子不行, 可能是因为new出来的provider还没有和context关联,
              // 或者是因为他们是的同级无法做到,
              // 最好的做法是让provider在顶级, 他要控制的部件作为子级
//              Text(provider.value.toString()),
              ShowWidget(),
              MyButton("-"),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text('Inkell'),
                ),
                splashColor: Colors.purple, //水波纹颜色
//                highlightColor: Colors.purple, // 按下的颜色
//                focusColor: Colors.cyan, // 获取焦点的颜色
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String msg;

  MyButton(this.msg);

  @override
  Widget build(BuildContext context) {
    final MyProvide provider = Provider.of(context);
    return RaisedButton(
      onPressed: () {
        switch (msg) {
          case "+":
            provider.increment(1);
            break;
          case "-":
            provider.increment(-1);
            break;
        }
      },
      child: Text(msg),
    );
  }
}

class ShowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyProvide provider = Provider.of(context);
    return Text(provider.value.toString());
  }
}
