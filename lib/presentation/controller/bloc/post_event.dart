part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class UpdatePostEvent extends PostEvent {
  final Post post;

  const UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class UpDownPostEvent extends PostEvent {
  final UpDownPostParameters upDownPostParameters;

  const UpDownPostEvent({required this.upDownPostParameters});

  @override
  List<Object> get props => [upDownPostParameters];
}

class UpDownReplyEvent extends PostEvent {
  final UpDownReplyParameters upDownReplyParameters;

  const UpDownReplyEvent({required this.upDownReplyParameters});

  @override
  List<Object> get props => [upDownReplyParameters];
}

class SendMessageEvent extends PostEvent {
  final SendMessageParameters sendMessageParameters;

  const SendMessageEvent({required this.sendMessageParameters});

  @override
  List<Object> get props => [sendMessageParameters];
}

class DeleteReplyEvent extends PostEvent {
  final DeleteReplyParameters deleteReplyParameters;

  const DeleteReplyEvent({required this.deleteReplyParameters});

  @override
  List<Object> get props => [deleteReplyParameters];
}
