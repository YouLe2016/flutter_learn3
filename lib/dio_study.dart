
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'provide/DioProvide.dart';

void main() => runApp(DioApp());

class DioApp extends StatefulWidget {
  @override
  _DioAppState createState() => _DioAppState();
}

class _DioAppState extends State<DioApp> {

  @override
  void initState() {
    super.initState();
    print("--- initState");
//    dioModel = DioProvide();
//    dioModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    DioProvide dioModel = ScopedModel.of<DioProvide>(context);
    /*return ScopedModel<DioProvide>(
      model: dioModel,
      child: MaterialApp(
        home: Scaffold(
          body: Center(
//            child: ScopedModelDescendant<DioProvide>(
//              builder: (context, child, model) => Text(model.categories),
//            ),
          ),
        ),
      ),
    );*/
    return MaterialApp(
      home: Scaffold(
        body: Center(
//            child: ScopedModelDescendant<DioProvide>(
//              builder: (context, child, model) => Text(model.categories),
//            ),
            ),
      ),
    );
  }
}
