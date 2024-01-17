import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/domain/entities/post/reply.dart';
import 'package:reddit/domain/usecases/delete_reply_uc.dart';
import 'package:reddit/domain/usecases/send_message_uc.dart';
import 'package:reddit/domain/usecases/up_down_post_uc.dart';

import '../../domain/usecases/up_down_reply_uc.dart';

abstract class BasePostLocalDataSource {
  Post upDownPost(UpDownPostParameters upDownPostParameters);
  Post upDownReply(UpDownReplyParameters upDownReplyParameters);
  Post sendMessage(SendMessageParameters sendMessageParameters);
  Post deleteReply(DeleteReplyParameters deleteReplyParameters);
}

class PostLocalDataSource extends BasePostLocalDataSource {
  @override
  Post upDownPost(UpDownPostParameters upDownPostParameters) {
    Post post = upDownPostParameters.post;
    if (upDownPostParameters.isUp) {
      return Post(
          postText: post.postText,
          up: post.up + 1,
          down: post.down - 1,
          videoUrl: post.videoUrl,
          user: post.user,
          replies: post.replies);
    }
    return Post(
        postText: post.postText,
        up: post.up - 1,
        down: post.down + 1,
        videoUrl: post.videoUrl,
        user: post.user,
        replies: post.replies);
  }

  @override
  Post upDownReply(UpDownReplyParameters upDownReplyParameters) {
    Post post = upDownReplyParameters.post;
    final List<Reply> replies = List.from(post.replies);

    if (upDownReplyParameters.subIndex == -1) {
      Reply reply =
          upDownReplyParameters.post.replies[upDownReplyParameters.index];
      Reply replyUpdated = Reply(
          user: reply.user,
          replyText: reply.replyText,
          dateTime: reply.dateTime,
          up: upDownReplyParameters.isUp ? reply.up + 1 : reply.up - 1,
          down: !upDownReplyParameters.isUp ? reply.down - 1 : reply.down + 1,
          replies: reply.replies);
      replies[upDownReplyParameters.index] = replyUpdated;
      return Post(
          postText: post.postText,
          up: post.up,
          down: post.down,
          videoUrl: post.videoUrl,
          user: post.user,
          replies: replies);
    }
    Reply reply = upDownReplyParameters
        .post
        .replies[upDownReplyParameters.index]
        .replies[upDownReplyParameters.subIndex];
    Reply replyUpdated = Reply(
        user: reply.user,
        replyText: reply.replyText,
        dateTime: reply.dateTime,
        up: upDownReplyParameters.isUp ? reply.up + 1 : reply.up - 1,
        down: !upDownReplyParameters.isUp ? reply.down - 1 : reply.down + 1,
        replies: reply.replies);
    replies[upDownReplyParameters.index]
        .replies[upDownReplyParameters.subIndex] = replyUpdated;
    return Post(
        postText: post.postText,
        up: post.up,
        down: post.down,
        videoUrl: post.videoUrl,
        user: post.user,
        replies: replies);
  }

  @override
  Post deleteReply(DeleteReplyParameters deleteReplyParameters) {
    Post post = deleteReplyParameters.post;
    if (deleteReplyParameters.subIndex == -1) {
      List<Reply> replies = List.from(post.replies);
      replies.removeAt(deleteReplyParameters.index);
      return Post(
          postText: post.postText,
          up: post.up,
          down: post.down,
          videoUrl: post.videoUrl,
          user: post.user,
          replies: replies);
    }
    List<Reply> replies = List.from(post.replies);
    replies[deleteReplyParameters.index]
        .replies
        .removeAt(deleteReplyParameters.subIndex);
    replies.removeAt(deleteReplyParameters.index);
    return Post(
        postText: post.postText,
        up: post.up,
        down: post.down,
        videoUrl: post.videoUrl,
        user: post.user,
        replies: replies);
  }

  @override
  Post sendMessage(SendMessageParameters sendMessageParameters) {
    Post post = sendMessageParameters.post;
    List<Reply> replies = List.from(post.replies);
    replies.add(Reply(
        user: post.user,
        replyText: sendMessageParameters.message,
        dateTime: DateTime.now(),
        up: 0,
        down: 0,
        replies: const []));
    return Post(
        postText: post.postText,
        up: post.up,
        down: post.down,
        videoUrl: post.videoUrl,
        user: post.user,
        replies: replies);
  }
}
