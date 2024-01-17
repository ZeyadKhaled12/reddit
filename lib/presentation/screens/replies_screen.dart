import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/presentation/widgets/replies_widgets/repies_body.dart';

import '../../core/utils/enums.dart';
import '../controller/bloc/post_bloc.dart';

class RepliesScreen extends StatelessWidget {
  const RepliesScreen({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      buildWhen: (previous, current) =>
          previous.postRequestState != current.postRequestState,
      builder: (context, state) {
        switch (state.postRequestState) {
          case RequestState.loading:
            return RepliesBody(post: post);
          case RequestState.loaded:
            return RepliesBody(post: post);
          case RequestState.error:
            return RepliesBody(post: post);
        }
      },
    );
  }
}
