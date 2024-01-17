part of 'post_bloc.dart';

class PostState extends Equatable {
  final Post post;
  final RequestState postRequestState;
  final String errorPostMessage;

  const PostState(
      {this.post = const Post(
          postText: '',
          up: 0,
          down: 0,
          videoUrl: '',
          user: User(backgroundUrl: '', name: ''),
          replies: []),
      this.postRequestState = RequestState.loaded,
      this.errorPostMessage = ''});

  PostState copyWith({
    Post? post,
    RequestState? postRequestState,
    String? errorPostMessage,
  }) {
    return PostState(
        post: post ?? this.post,
        postRequestState: postRequestState ?? this.postRequestState,
        errorPostMessage: errorPostMessage ?? this.errorPostMessage);
  }

  @override
  List<Object> get props => [post, postRequestState, errorPostMessage];
}
