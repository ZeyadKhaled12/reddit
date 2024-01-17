import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/domain/usecases/send_message_uc.dart';
import 'package:reddit/presentation/controller/bloc/post_bloc.dart';

import '../../../domain/entities/post/post.dart';
import '../../../domain/entities/post/reply.dart';
import 'replies_widget_textfield.dart';
import 'reply_widgets/reply_widget.dart';

class RepliesBody extends StatefulWidget {
  const RepliesBody({super.key, required this.post});
  final Post post;

  @override
  State<RepliesBody> createState() => _RepliesBodyState();
}

class _RepliesBodyState extends State<RepliesBody> {
  final TextEditingController controller = TextEditingController();
  late List<Reply> replies;
  @override
  void initState() {
    replies = widget.post.replies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height * 2 / 3) - 25,
      decoration: const BoxDecoration(
          color: Color(0XFF121212),
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
                width: 80,
                height: 50,
                child: Divider(
                    color: Colors.white.withOpacity(0.35), thickness: 3.5)),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  ReplyWidget(post: widget.post, index: index),
              itemCount: replies.length,
            ),
          ),
          RepliesWidgetTextField(
            controller: controller,
            sendMessage: () {
              if (controller.text.isEmpty) {
                setState(() {
                  replies.add(Reply(
                      user: widget.post.user,
                      replyText: controller.text,
                      dateTime: DateTime.now(),
                      up: 0,
                      down: 0,
                      replies: const []));
                  controller.clear();
                });
                context.read<PostBloc>().add(SendMessageEvent(
                    sendMessageParameters: SendMessageParameters(
                        post: widget.post, message: controller.text)));
              }
            },
          ),
        ],
      ),
    );
  }
}
