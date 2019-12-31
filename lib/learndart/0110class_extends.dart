import '0109class.dart';

main() {
  // 继承
  var newPoint = NewPoint(2, 3);

  // 实现
  var person = Person('LiSi');
  greetBob(person);
  var person2 = Impostor();

  print(person2._realName);
}

class NewPoint extends Point {
  NewPoint(num x, num y) : super(x, y) {
    print("初始化完成: ${toString()}  $hashCode");
  }

  NewPoint.origin() : super.origin() {
    print(
        "初始化完成: NewPoint.origin{x: $x, y: $y, distanceFromOrigin: $distanceFromOrigin}");
  }

  @override
  String toString() {
    return 'NewPoint{x: $x, y: $y, distanceFromOrigin: $distanceFromOrigin}"';
  }
}

class Person {
  String name;

  Person(this.name);

  String greet(Person person) => 'Hi $person. I am $name.';

  @override
  String toString() {
    return '$name';
  }
}

greetBob(Person person) => print(person.greet(Person("Bob")));

class Impostor implements Person {
  @override
  String greet(Person person) {
    return 'Hi $person. Do you know who I am?';
  }

  @override
  String name = '';

  String _realName = 'Impostor';

  String get _name => _realName;
}
