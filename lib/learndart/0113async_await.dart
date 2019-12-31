import 'dart:io';

main() {
  print('-------begin--------');
  var task1 = task();
  task1.then((value) {
    print('-------task1.end--------');
  });
  print('-------end--------');
  /*
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  -------begin--------
  // 停顿5s
  -------end--------
  task finish.  LiSi
  -------task1.end--------
  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  -------begin--------
  -------end--------
  // 停顿5s
  task finish.  LiSi
  -------task1.end--------
   */
}

Future<void> task() async {
//  sleep(Duration(seconds: 2));
  var username = await getUserInfo();
  print("task finish.  $username");
}

//Future<String> getUserInfo() async {
//  sleep(Duration(seconds: 5));
//  return "LiSi";
//}

Future<String> getUserInfo() async {
  return Future.delayed(Duration(seconds: 5), () {
    return "LiSi";
  });
}
