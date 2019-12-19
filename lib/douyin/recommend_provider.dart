import 'package:FlutterDemo/constant.dart';
import 'package:flutter/material.dart';

class RecommendProvider extends ChangeNotifier {
  Reply reply;

  RecommendProvider() {
    reply = Reply(
        ifFavorite: true,
        afterReplies: List<Reply>(),
        replyContent: "真可爱，真好看，真厉害~真可爱，真好看，真厉害~ ",
        replyMakerAvatar: imgHeader,
        replyMakerName: "ABC",
        whenReplied: "3小时前");
  }
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
