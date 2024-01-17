import 'package:reddit/data/datasource/post_local_data_source.dart';
import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/domain/usecases/delete_reply_uc.dart';
import 'package:reddit/domain/usecases/send_message_uc.dart';
import 'package:reddit/domain/usecases/up_down_post_uc.dart';

import '../../domain/usecases/up_down_reply_uc.dart';

abstract class BasePostRepo {
  Post upDownPost(UpDownPostParameters parameters);
  Post upDownReply(UpDownReplyParameters parameters);
  Post sendMessage(SendMessageParameters parameters);
  Post deleteReply(DeleteReplyParameters parameters);
}

class PostRepo extends BasePostRepo {
  BasePostLocalDataSource basePostLocalDataSource;
  PostRepo(this.basePostLocalDataSource);
  @override
  Post upDownPost(UpDownPostParameters parameters) {
    return basePostLocalDataSource.upDownPost(parameters);
  }

  @override
  Post upDownReply(UpDownReplyParameters parameters) {
    return basePostLocalDataSource.upDownReply(parameters);
  }

  @override
  Post deleteReply(DeleteReplyParameters parameters) {
    return basePostLocalDataSource.deleteReply(parameters);
  }

  @override
  Post sendMessage(SendMessageParameters parameters) {
    return basePostLocalDataSource.sendMessage(parameters);
  }
}
