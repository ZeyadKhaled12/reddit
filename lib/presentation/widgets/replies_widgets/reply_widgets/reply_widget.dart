import 'package:flutter/material.dart';
import '../../../../domain/entities/post/post.dart';
import 'reply_widget_message.dart';

class ReplyWidget extends StatelessWidget {
  const ReplyWidget({super.key, required this.post, required this.index});
  final Post post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0XFF211C22),
      padding: const EdgeInsets.only(left: 20, bottom: 15, top: 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(color: Colors.white.withOpacity(0.28)))),
        child: Column(
          children: [
            ReplyWidgetMessage(
              padding: 20,
              index: index,
              subIndex: -1,
              post: post,
              showBorder: false,
              reply: post.replies[index],
            ),
            if (post.replies[index].replies.isNotEmpty)
              Column(
                children: List.generate(
                    post.replies[index].replies.length,
                    (index) => ReplyWidgetMessage(
                          padding: 40,
                          index: this.index,
                          subIndex: index,
                          post: post,
                          showBorder: true,
                          reply: post.replies[this.index].replies[index],
                        )),
              )
          ],
        ),
      ),
    );
  }
}
