import 'package:FlutterDemo/constant.dart';
import 'package:flutter/material.dart';

class RecommendProvider extends ChangeNotifier {
  MainInfo mainInfo;
  Reply reply;

  RecommendProvider() {
    mainInfo = MainInfo(
      avatarUrl:
          "https://pic2.zhimg.com/v2-a88cd7618933272ca681f86398e6240d_xll.jpg",
      content:
          "奥斯卡答复哈士大夫哈师大发输电和健康阿萨德鸿福路口氨基酸的鸿福路口啊,奥斯卡答复哈士大夫哈师大发输电和健康阿萨德鸿福路口氨基酸的鸿福路口啊",
      favCount: 109,
      replyCount: 212,
      shareCount: 317,
      userName: "乐哥哥",
      videoPath: "lib/images/pingguo.jpeg",
      desc: "乐哥哥做的一个有意思的模拟抖音的小App，用的Flutter哦~",
      ifFaved: false,
    );

    reply = Reply(
        ifFavorite: true,
        afterReplies: List<Reply>(),
        replyContent: "真可爱，真好看，真厉害~真可爱，真好看，真厉害~ ",
        replyMakerAvatar: imgHeader,
        replyMakerName: "ABC",
        whenReplied: "3小时前");
  }

  tapFav() {
    mainInfo.ifFaved = !mainInfo.ifFaved;
    if (mainInfo.ifFaved) {
      mainInfo.favCount += 1;
    } else {
      mainInfo.favCount -= 1;
    }
    notifyListeners();
  }
}

class MainInfo {
  String avatarUrl;
  String userName;
  String content;
  int favCount;
  int replyCount;
  int shareCount;
  String videoPath;
  String desc;
  bool ifFaved;

  MainInfo(
      {this.avatarUrl,
      this.content,
      this.favCount,
      this.replyCount,
      this.shareCount,
      this.userName,
      this.videoPath,
      this.desc,
      this.ifFaved});
}

class Reply {
  String replyMakerName;
  String replyMakerAvatar;
  String replyContent;
  String whenReplied;
  bool ifFavorite;
  List<Reply> afterReplies;

  Reply(
      {this.ifFavorite,
      this.afterReplies,
      this.replyContent,
      this.replyMakerAvatar,
      this.replyMakerName,
      this.whenReplied});
}
