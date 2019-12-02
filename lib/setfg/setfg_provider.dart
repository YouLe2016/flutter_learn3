import 'package:flutter/material.dart';

class SetfgProvider extends ChangeNotifier {
  var size = 4;
  List<int> data;
  var curNum = 1;

  SetfgProvider(this.size) {
    data = List.generate(size * size, (index) => index + 1);
    data.shuffle();
  }

  nextNumber() {
    curNum++;
    notifyListeners();
  }
}
