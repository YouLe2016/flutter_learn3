import 'package:flutter/material.dart';

class MyProvide extends ChangeNotifier {
  int value = 0;

  increment(int value) {
    this.value += value;
    notifyListeners();
  }
}
