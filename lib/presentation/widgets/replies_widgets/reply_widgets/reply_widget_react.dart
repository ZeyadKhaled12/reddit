import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/domain/entities/post/reply.dart';
import 'package:reddit/domain/usecases/up_down_reply_uc.dart';
import 'package:reddit/presentation/controller/bloc/post_bloc.dart';
import 'package:reddit/presentation/screens/settings_Screen.dart';

import '../../../../core/utils/assets_manager.dart';

class ReplyWidgetReact extends StatefulWidget {
  const ReplyWidgetReact(
      {super.key,
      required this.reply,
      required this.index,
      required this.subindex,
      required this.post});
  final Reply reply;
  final int index;
  final int subindex;
  final Post post;

  @override
  State<ReplyWidgetReact> createState() => _ReplyWidgetReactState();
}

class _ReplyWidgetReactState extends State<ReplyWidgetReact> {
  bool? isRoundUp;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                backgroundColor: const Color(0XFF28363B),
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                builder: (context) {
                  return SettingsScreen(
                    post: widget.post,
                    index: widget.index,
                    subIndex: widget.subindex,
                  );
                },
              );
            },
            icon: const Icon(Icons.more_horiz, color: Color(0XFFC8C0C9))),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.subdirectory_arrow_left_sharp,
                color: Color(0XFFC8C0C9))),
        IconValue(
            height: 25,
            onTap: () {
              if (isRoundUp == null || !isRoundUp!) {
                context.read<PostBloc>().add(UpDownReplyEvent(
                    upDownReplyParameters: UpDownReplyParameters(
                        post: widget.post,
                        isUp: true,
                        index: widget.index,
                        subIndex: widget.subindex)));
                setState(() {
                  isRoundUp = true;
                });
              }
            },
            degreeRotate: 0,
            iconDataSVG: SvgAssets.arrowUp(
                strokeColor: 'C8C0C9',
                strokeSize: isRoundUp == null
                    ? '12'
                    : isRoundUp!
                        ? '0'
                        : '12',
                colorHex: isRoundUp == null
                    ? '000000'
                    : isRoundUp!
                        ? 'F95228'
                        : '000000'),
            value: widget.reply.up,
            isShowValue: isRoundUp ?? false),
        IconValue(
            height: 25,
            onTap: () {
              if (isRoundUp == null || isRoundUp!) {
                context.read<PostBloc>().add(UpDownReplyEvent(
                    upDownReplyParameters: UpDownReplyParameters(
                        post: widget.post,
                        isUp: false,
                        index: widget.index,
                        subIndex: widget.subindex)));
                setState(() {
                  isRoundUp = false;
                });
              }
            },
            degreeRotate: 180,
            iconDataSVG: SvgAssets.arrowUp(
                strokeColor: 'C8C0C9',
                strokeSize: isRoundUp == null
                    ? '12'
                    : isRoundUp!
                        ? '12'
                        : '0',
                colorHex: isRoundUp == null
                    ? '000000'
                    : isRoundUp!
                        ? '000000'
                        : '6D7EA7'),
            value: widget.reply.down,
            isShowValue: isRoundUp == null ? false : !isRoundUp!),
      ],
    );
  }
}

class IconValue extends StatelessWidget {
  const IconValue(
      {super.key,
      required this.iconDataSVG,
      required this.value,
      this.onTap,
      this.isShowValue = true,
      this.degreeRotate = 0,
      this.height = 32});
  final String iconDataSVG;
  final int value;
  final Function()? onTap;
  final bool isShowValue;
  final double degreeRotate;
  final double height;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Row(
        children: [
          if (isShowValue)
            Text(
              '$value',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          RotationTransition(
              turns: AlwaysStoppedAnimation(degreeRotate / 360),
              child: SvgPicture.string(iconDataSVG, height: height)),
        ],
      ),
    );
  }
}
