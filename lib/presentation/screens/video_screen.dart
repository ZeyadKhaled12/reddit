import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/enums.dart';
import '../controller/bloc/post_bloc.dart';
import '../widgets/video_widgets/video_body.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key, required this.isTop, required this.showBottom});
  final bool isTop;
  final Function() showBottom;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      buildWhen: (previous, current) =>
          previous.postRequestState != current.postRequestState,
      builder: (context, state) {
        switch (state.postRequestState) {
          case RequestState.loading:
            return VideoBody(
                post: state.post, isTop: isTop, showBottom: showBottom);
          case RequestState.loaded:
            return VideoBody(
                post: state.post, isTop: isTop, showBottom: showBottom);
          case RequestState.error:
            return VideoBody(
                post: state.post, isTop: isTop, showBottom: showBottom);
        }
      },
    );
  }
}
