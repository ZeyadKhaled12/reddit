import 'package:flutter/material.dart';
import 'package:reddit/core/utils/assets_manager.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/entities/post/post.dart';
import 'video_widget_comment.dart';
import 'video_widget_react.dart';
import 'video_widget_slider.dart';

class VideoBody extends StatefulWidget {
  const VideoBody(
      {super.key,
      required this.isTop,
      required this.showBottom,
      required this.post});
  final bool isTop;
  final Function() showBottom;
  final Post post;

  @override
  State<VideoBody> createState() => _VideoBodyState();
}

class _VideoBodyState extends State<VideoBody> {
  bool isVolumeOpen = true;
  bool isPuase = true;
  late VideoPlayerController controller;
  Duration? position;
  bool isLoading = true;

  String videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  void initState() {
    controller = VideoPlayerController.asset(VideoAssets.textVideo)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) async {
        await controller.play();
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment:
              widget.isTop ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.green,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1 / 3,
              child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller)),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: VideoWidgetComment(
                          post: widget.post,
                        )),
                        Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 1 / 8)),
                        VideoWidgetReact(
                            showBottom: widget.showBottom, post: widget.post)
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                    VideoWidgetSlider(
                        isVolumeOpen: isVolumeOpen,
                        time: videoDuration(controller.value.duration),
                        isPause: isPuase,
                        pauseResumFun: () {
                          if (controller.value.isPlaying) {
                            controller.pause();
                          } else {
                            controller.play();
                          }
                          setState(() {
                            isPuase = !isPuase;
                          });
                        },
                        volumFun: () {
                          setState(() {
                            isVolumeOpen = !isVolumeOpen;
                          });
                        })
                  ],
                ))
          ],
        ));
  }
}
