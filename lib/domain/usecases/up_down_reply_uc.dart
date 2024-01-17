import 'package:equatable/equatable.dart';

import '../../core/usecase/base_use_case.dart';
import '../../data/repositroy/post_repo.dart';
import '../entities/post/post.dart';

class UpDownReplyUc extends BaseUseCaseInside<Post, UpDownReplyParameters> {
  final BasePostRepo basePostRepo;

  UpDownReplyUc(this.basePostRepo);

  @override
  Post change(UpDownReplyParameters parameters) {
    return basePostRepo.upDownReply(parameters);
  }
}

class UpDownReplyParameters extends Equatable {
  final Post post;
  final bool isUp;
  final int index;
  final int subIndex;

  const UpDownReplyParameters({
    required this.post,
    required this.isUp,
    required this.index,
    required this.subIndex,
  });

  @override
  List<Object?> get props => [post, isUp, index, subIndex];
}
