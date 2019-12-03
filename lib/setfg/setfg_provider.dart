import 'dart:async';

import 'package:flutter/material.dart';

class SetfgProvider extends ChangeNotifier {
  int size;
  List<int> data;
  int curNum;
  double totalTime;

  Timer _timer;

  SetfgProvider(this.size) {
    _init();
  }

  _init() {
    data = List.generate(size * size, (index) => index + 1)..shuffle();
    totalTime = 0.0;
    curNum = 1;
    notifyListeners();
  }

  startTimer() {
    if (_timer != null) return;
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      totalTime += 0.1;
      notifyListeners();
    });
  }

  stopTimer() {
    _timer?.cancel();
  }

  restart() {
    _init();
    stopTimer();
    _timer = null;
  }

  start(int size) {
    this.size = size;
    _init();
    stopTimer();
    _timer = null;
  }
}
