import 'package:equatable/equatable.dart';
import '../../core/usecase/base_use_case.dart';
import '../../data/repositroy/post_repo.dart';
import '../entities/post/post.dart';

class UpDownPostUc extends BaseUseCaseInside<Post, UpDownPostParameters> {
  final BasePostRepo basePostRepo;

  UpDownPostUc(this.basePostRepo);

  @override
  Post change(UpDownPostParameters parameters) {
    return basePostRepo.upDownPost(parameters);
  }
}

class UpDownPostParameters extends Equatable {
  final Post post;
  final bool isUp;

  const UpDownPostParameters({required this.post, required this.isUp});

  @override
  List<Object?> get props => [post, isUp];
}
