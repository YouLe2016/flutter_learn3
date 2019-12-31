/// 8.掌握了Dart中的函数，你就掌握了原力！
/// 声明一个函数
/// 可选命名参数

main() {
  /// 声明一个函数
  /// 如果一个函数没有显示声明返回值，Dart 会自动推导它的返回值类型。
  /// 如果一个函数没有显示的 return，那么它默认会返回 null。
  /// 如果一个函数只有一句表达式，可以使用简写：
  print(isNull(4));
  print(isNull(null));

  /// 可选命名参数
  nameFun("nameFun", name: "lisi", age: 33);

  /// 可选位置参数
  positionFun("positionFun", 23);

  /// 函数作为变量
  var printer = (msg) => print("excute $msg");
  printer("printer1");
  print(printer);

  /// 函数作为入参
  execute(() => print("excute"));

  /// 函数闭包
  var add2 = makeAdd(2);
  var add4 = makeAdd(4);
  print(add2(3));
  print(add4(3));

  final counter = reduce();
  print(counter());
  print(counter());
  print(counter());

  /*
   * typedef 关键字
   * 当你打算把一个函数赋值给 Compare 类型的变量时，
   * 它会严格检查 函数的参数类型 和 返回值类型 是否和 Compare 类型函数 完全对应，
   * 不对应的话，编译就会报错。
   * */
  Compare test = (Object a, Object b) {
    return 0;
  };
}

typedef int Compare(Object a, Object b);

makeAdd(num addBy) {
  return (num i) {
    return i + addBy;
  };
}

reduce() {
  num count = 0;
  return () {
    return ++count;
  };
}

execute(callback) => callback();

isNull(int number) => number == null;

void nameFun(String fun, {String name:"aa", int age}) {
  print("$fun $name $age");
}

void positionFun(String fun, [int age, String name = "小白"]) =>
    print("$fun $name $age");
