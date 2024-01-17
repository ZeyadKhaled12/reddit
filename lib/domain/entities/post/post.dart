import 'package:equatable/equatable.dart';
import 'package:reddit/domain/entities/post/reply.dart';
import 'package:reddit/domain/entities/user.dart';

class Post extends Equatable {
  final String postText;
  final int up;
  final int down;
  final String videoUrl;
  final User user;
  final List<Reply> replies;

  const Post(
      {required this.postText,
      required this.up,
      required this.down,
      required this.videoUrl,
      required this.user,
      required this.replies});

  @override
  List<Object?> get props => [postText, up, down, videoUrl, user, replies];
}
