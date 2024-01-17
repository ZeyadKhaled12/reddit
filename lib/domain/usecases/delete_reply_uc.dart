import 'package:equatable/equatable.dart';

import '../../core/usecase/base_use_case.dart';
import '../../data/repositroy/post_repo.dart';
import '../entities/post/post.dart';

class DeleteReplyUc extends BaseUseCaseInside<Post, DeleteReplyParameters> {
  final BasePostRepo basePostRepo;

  DeleteReplyUc(this.basePostRepo);

  @override
  Post change(DeleteReplyParameters parameters) {
    return basePostRepo.deleteReply(parameters);
  }
}

class DeleteReplyParameters extends Equatable {
  final Post post;
  final int index;
  final int subIndex;

  const DeleteReplyParameters(
      {required this.post, required this.index, required this.subIndex});

  @override
  List<Object?> get props => [post, index, subIndex];
}
