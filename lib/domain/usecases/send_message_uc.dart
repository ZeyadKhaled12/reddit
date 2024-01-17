import 'package:equatable/equatable.dart';

import '../../core/usecase/base_use_case.dart';
import '../../data/repositroy/post_repo.dart';
import '../entities/post/post.dart';

class SendMessageUc extends BaseUseCaseInside<Post, SendMessageParameters> {
  final BasePostRepo basePostRepo;

  SendMessageUc(this.basePostRepo);

  @override
  Post change(SendMessageParameters parameters) {
    return basePostRepo.sendMessage(parameters);
  }
}

class SendMessageParameters extends Equatable {
  final Post post;
  final String message;

  const SendMessageParameters({required this.post, required this.message});

  @override
  List<Object?> get props => [post, message];
}
