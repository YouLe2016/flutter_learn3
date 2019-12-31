import '0110class_extends.dart';

/// 它和 class 比较类似，但它没有构造函数。
/// 通过 mixin，可以扩展一个类的属性和功能，使得类具有 Mixin 类的属性和函数 API。

main() {
  var p = Chinese("WangWu");
  p.entertainMe();
}

class Chinese extends Person with Musical {
  Chinese(String name) : super(name);
}

mixin Musical {
  bool canPlayPiano = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}
