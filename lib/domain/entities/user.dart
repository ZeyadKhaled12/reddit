import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String backgroundUrl;
  final String name;

  const User({required this.backgroundUrl, required this.name});

  @override
  List<Object?> get props => [backgroundUrl, name];
}
