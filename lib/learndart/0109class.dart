import 'dart:math';

import '0110class_extends.dart';

main() {
  /*
  定义一个类
  创建一个类对象
   */
  var p = Point(1, 1);
  print(p);
  var p2 = Point.origin();
  print(p2);
  Point p3;

  // 使用类的属性
  print("x = ${p.x}");

  // 空安全 ?.
  print('x = ${p3?.x}');

  // 级联操作符 ..
  // 当然前提是，你所调用的函数返回值为 void 。
  p..describe()..describe();

  // get/set 函数
  var rectangle = Rectangle(1, 1, 3, 2);
  print('bottom = ${rectangle.bottom}');

  // runtimeType
  print(rectangle.runtimeType);
  /*
  =============
  runtimeType
   */
}

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(this.x, this.y) : distanceFromOrigin = sqrt(x * x + y * y) {
    print("初始化完成: ${toString()}  $hashCode");
  }

  Point.origin()
      : x = 0,
        y = 0,
        distanceFromOrigin = 0;

  void describe() {
    print('{x: $x, y: $y}');
  }

  @override
  String toString() {
    return 'Point{x: $x, y: $y, distanceFromOrigin: $distanceFromOrigin}';
  }
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  set right(num value) {
    left = value - width;
  }

  num get right {
    return left + width;
  }

  num get bottom => top + height;

  set bottom(num value) => top = value - height;
}
