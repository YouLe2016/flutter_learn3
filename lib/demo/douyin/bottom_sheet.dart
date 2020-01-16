import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'recommend_provider.dart';

class ReplyFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    RecommendProvider provider = Provider.of<RecommendProvider>(context);
    Reply reply = provider.reply;
    List<Reply> replies = List.generate(10, (index) => reply);

    var scrollController = ScrollController();
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: <Widget>[
          Container(
            height: 80 * rpx,
            child: ListTile(
              trailing: IconButton(icon: Icon(Icons.close), onPressed: () {}),
              title: Center(child: Text('10条评论')),
            ),
          ),
          generateReplayList(replies, scrollController),
        ],
      ),
    );
  }
}

generateReplayList(List<Reply> replies, ScrollController scrollController) {
  return ListView.builder(
    controller: scrollController,
    // 无限列表有最小距离
    shrinkWrap: true,
    itemCount: replies.length,
    itemBuilder: (context, index) =>
        ReplyList(replies[index], scrollController),
  );
}

generateAfterReplayList(
    List<Reply> replies, ScrollController scrollController) {
  return ListView.builder(
    controller: scrollController,
    shrinkWrap: true,
    itemCount: min(replies.length, 2),
    itemBuilder: (context, index) => AfterReply(replies[index]),
  );
}

class ReplyList extends StatelessWidget {
  final Reply reply;
  final ScrollController scrollController;

  ReplyList(this.reply, this.scrollController);

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    List<Reply> replies = List.generate(3, (index) => reply);
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            radius: 50 * rpx,
            backgroundImage: NetworkImage(reply.replyMakerAvatar),
          ),
          title: Text(reply.replyMakerName),
          subtitle: Text(
            reply.replyContent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
        ),
        generateAfterReplayList(replies, scrollController),
      ],
    );
  }
}

class AfterReply extends StatelessWidget {
  final Reply afterReply;

  AfterReply(this.afterReply);

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 70 * rpx),
        Padding(
          padding: EdgeInsets.only(top: 10 * rpx),
          child: CircleAvatar(
            radius: 25 * rpx,
            backgroundImage: NetworkImage(afterReply.replyMakerAvatar),
          ),
        ),
        Flexible(
          child: ListTile(
            title: Text(afterReply.replyMakerName),
            subtitle: RichText(
              text: TextSpan(
                text: afterReply.replyContent,
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(text: "${afterReply.whenReplied}"),
                ],
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.green,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
