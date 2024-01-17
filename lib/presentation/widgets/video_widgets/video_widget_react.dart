import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/domain/usecases/up_down_post_uc.dart';
import 'package:reddit/presentation/controller/bloc/post_bloc.dart';
import '../../../core/utils/assets_manager.dart';

class VideoWidgetReact extends StatefulWidget {
  const VideoWidgetReact(
      {super.key, required this.showBottom, required this.post});
  final Function() showBottom;
  final Post post;

  @override
  State<VideoWidgetReact> createState() => _VideoWidgetReactState();
}

class _VideoWidgetReactState extends State<VideoWidgetReact> {
  bool isRoundUp = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(padding: EdgeInsets.only(top: 10)),
        IconValue(
            onTap: () {
              if (!isRoundUp) {
                context.read<PostBloc>().add(UpDownPostEvent(
                    upDownPostParameters:
                        UpDownPostParameters(post: widget.post, isUp: true)));
                setState(() {
                  isRoundUp = true;
                });
              }
            },
            degreeRotate: 0,
            iconDataSVG: SvgAssets.arrowUp(
                strokeColor: 'FFFFFF',
                strokeSize: isRoundUp ? '0' : '12',
                colorHex: isRoundUp ? 'F95228' : '000000'),
            value: widget.post.up,
            isShowValue: isRoundUp),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        IconValue(
            onTap: () {
              if (isRoundUp) {
                context.read<PostBloc>().add(UpDownPostEvent(
                    upDownPostParameters:
                        UpDownPostParameters(post: widget.post, isUp: false)));
                setState(() {
                  isRoundUp = false;
                });
              }
            },
            degreeRotate: 180,
            iconDataSVG: SvgAssets.arrowUp(
                strokeColor: 'FFFFFF',
                strokeSize: isRoundUp ? '12' : '0',
                colorHex: isRoundUp ? '000000' : '6D7EA7'),
            value: widget.post.down,
            isShowValue: !isRoundUp),
        const Padding(padding: EdgeInsets.only(bottom: 25)),
        IconValue(
            iconDataSVG: SvgAssets.messageBuble(strokeSize: 100),
            value: widget.post.replies.length,
            height: 25,
            onTap: widget.showBottom),
        const Padding(padding: EdgeInsets.only(bottom: 25)),
        SvgPicture.string(SvgAssets.downloadIcon(), height: 32)
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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          RotationTransition(
              turns: AlwaysStoppedAnimation(degreeRotate / 360),
              child: SvgPicture.string(iconDataSVG, height: height)),
          const Padding(padding: EdgeInsets.only(bottom: 4)),
          if (isShowValue)
            Text(
              '$value',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
        ],
      ),
    );
  }
}
