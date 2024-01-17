import 'package:equatable/equatable.dart';
import 'package:reddit/domain/entities/user.dart';

class Reply extends Equatable {
  final User user;
  final String replyText;
  final DateTime dateTime;
  final int up;
  final int down;
  final List<Reply> replies;

  const Reply(
      {required this.user,
      required this.replyText,
      required this.dateTime,
      required this.up,
      required this.down,
      required this.replies});

  @override
  List<Object?> get props => [user, replyText, dateTime, up, down, replies];
}
