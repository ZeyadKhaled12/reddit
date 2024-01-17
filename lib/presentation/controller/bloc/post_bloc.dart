import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/domain/entities/user.dart';
import 'package:reddit/domain/usecases/delete_reply_uc.dart';
import 'package:reddit/domain/usecases/up_down_post_uc.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/usecases/send_message_uc.dart';
import '../../../domain/usecases/up_down_reply_uc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final UpDownPostUc upDownPostUc;
  final UpDownReplyUc upDownReplyUc;
  final SendMessageUc sendMessageUc;
  final DeleteReplyUc deleteReplyUc;

  PostBloc(this.upDownPostUc, this.upDownReplyUc, this.sendMessageUc,
      this.deleteReplyUc)
      : super(const PostState()) {
    on<UpDownPostEvent>(_upDownPost);
    on<UpDownReplyEvent>(_upDownReply);
    on<UpdatePostEvent>(_updatePost);
    on<SendMessageEvent>(_sendMessage);
    on<DeleteReplyEvent>(_deleteReply);
  }

  FutureOr<void> _upDownPost(UpDownPostEvent event, Emitter<PostState> emit) {
    emit(state.copyWith(postRequestState: RequestState.loading));
    final result = upDownPostUc.change(event.upDownPostParameters);
    emit(state.copyWith(postRequestState: RequestState.loaded, post: result));
  }

  FutureOr<void> _updatePost(UpdatePostEvent event, Emitter<PostState> emit) {
    emit(state.copyWith(postRequestState: RequestState.loading));
    emit(state.copyWith(
        postRequestState: RequestState.loaded, post: event.post));
  }

  FutureOr<void> _deleteReply(DeleteReplyEvent event, Emitter<PostState> emit) {
    emit(state.copyWith(postRequestState: RequestState.loading));
    final result = deleteReplyUc.change(event.deleteReplyParameters);
    emit(state.copyWith(postRequestState: RequestState.loaded, post: result));
  }

  FutureOr<void> _upDownReply(UpDownReplyEvent event, Emitter<PostState> emit) {
    emit(state.copyWith(postRequestState: RequestState.loading));
    final result = upDownReplyUc.change(event.upDownReplyParameters);
    emit(state.copyWith(postRequestState: RequestState.loaded, post: result));
  }

  FutureOr<void> _sendMessage(SendMessageEvent event, Emitter<PostState> emit) {
    emit(state.copyWith(postRequestState: RequestState.loading));
    final result = sendMessageUc.change(event.sendMessageParameters);
    emit(state.copyWith(postRequestState: RequestState.loaded, post: result));
  }
}
