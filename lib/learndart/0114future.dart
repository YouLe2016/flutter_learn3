

main() {
  Future<String> login = Future(() => "username");

  login.then((value) {
    // do something
  });

  // Future 的常用函数

  // 可以等待多个异步任务执行完成后，再调用 then()。
  //只有有一个执行失败，就会进入 catchError()。
  Future.wait([
    Future.sync(() => "haha"),
    Future(() => "hehe"),
    // 延迟执行一个延时任务。
    Future.delayed(Duration(seconds: 2), () => "hello"),
    Future.delayed(Duration(seconds: 4), () => "world"),
  ]).then((result) {
    //执行成功会走到这里
    print(result);
    /*
    >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    [haha, hehe, hello, world] 异步任务按顺序执行了吗?
     */
  }).catchError((error) {
    //执行失败会走到这里
    print(error);
  }).whenComplete(() {
    //无论成功或失败都会走到这里
  });

//  sellTicket("窗口一");
//  sellTicket("窗口二");

//  Future.sync(()=>sellTicket1("窗口一"));
//  Future.sync(()=>sellTicket1("窗口2"));
}
//
//Future<void> sellTicket(String platform) async {
//  for (int i = 1; i <= 100; i++) {
//    sleep(Duration(milliseconds: 50));
//    print('$platform 售出第$i张票');
//  }
//}
//
//sellTicket1(String platform) {
//  for (int i = 1; i <= 100; i++) {
//    sleep(Duration(milliseconds: 50));
//    print('$platform 售出第$i张票');
//  }
//}
