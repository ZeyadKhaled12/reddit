import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/presentation/widgets/main_widgets/main_body.dart';
import '../../core/utils/enums.dart';
import '../controller/bloc/post_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      buildWhen: (previous, current) =>
          previous.postRequestState != current.postRequestState,
      builder: (context, state) {
        switch (state.postRequestState) {
          case RequestState.loading:
            return MainBody(post: state.post);
          case RequestState.loaded:
            return MainBody(post: state.post);
          case RequestState.error:
            return MainBody(post: state.post);
        }
      },
    );
  }
}
