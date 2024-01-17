import 'package:flutter/material.dart';

class VideoWidgetSlider extends StatelessWidget {
  const VideoWidgetSlider(
      {super.key,
      required this.isVolumeOpen,
      required this.volumFun,
      required this.pauseResumFun,
      required this.isPause,
      required this.time});
  final bool isVolumeOpen;
  final bool isPause;
  final Function() volumFun;
  final Function() pauseResumFun;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: pauseResumFun,
            child: Icon(isPause ? Icons.pause : Icons.play_arrow,
                color: Colors.white, size: 44)),
        Expanded(
            child: Slider(
          value: 0,
          onChanged: (value) {},
          activeColor: Colors.white,
          inactiveColor: Colors.white.withOpacity(0.3),
        )),
        Text(
          time,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        GestureDetector(
            onTap: volumFun,
            child: Icon(
                isVolumeOpen ? Icons.volume_up : Icons.volume_off_rounded,
                color: Colors.white,
                size: 35))
      ],
    );
  }
}
