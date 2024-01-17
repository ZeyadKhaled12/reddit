import 'package:flutter/material.dart';
import 'package:reddit/domain/entities/post/post.dart';

class VideoWidgetComment extends StatelessWidget {
  const VideoWidgetComment({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: NetworkImage(post.user.backgroundUrl),
                radius: 16.5),
            const Padding(padding: EdgeInsets.only(right: 5)),
            Text(
              post.user.name,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 15)),
        Text(
          post.postText,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
