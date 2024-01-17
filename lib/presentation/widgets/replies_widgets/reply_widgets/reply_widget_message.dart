import 'package:flutter/material.dart';
import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/domain/entities/post/reply.dart';

import 'reply_widget_react.dart';

class ReplyWidgetMessage extends StatelessWidget {
  const ReplyWidgetMessage(
      {super.key,
      required this.padding,
      required this.showBorder,
      required this.reply,
      required this.index,
      required this.subIndex,
      required this.post});
  final double padding;
  final bool showBorder;
  final Reply reply;
  final int index;
  final int subIndex;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      color: const Color(0XFF211C22),
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.only(left: padding, right: padding),
        decoration: BoxDecoration(
            color: const Color(0XFF211C22),
            border: showBorder
                ? Border(
                    left: BorderSide(color: Colors.white.withOpacity(0.28)))
                : null),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.pink,
                ),
                const Padding(padding: EdgeInsets.only(right: 10)),
                Text(
                  reply.user.name,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  ' . 5h',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.69),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              reply.replyText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            ReplyWidgetReact(
              reply: reply,
              post: post,
              index: index,
              subindex: subIndex,
            )
          ],
        ),
      ),
    );
  }
}
