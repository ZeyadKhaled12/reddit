import 'package:flutter/material.dart';

import '../../../domain/entities/post/post.dart';
import '../../screens/replies_screen.dart';
import '../../screens/video_screen.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key, required this.post});
  final Post post;

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  bool isTop = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void showSheet() {
    setState(() {
      isTop = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      enableDrag: true,
      backgroundColor: const Color(0XFF28363B),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      builder: (context) {
        return RepliesScreen(post: widget.post);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 25)),
          Expanded(
              child: VideoScreen(
            isTop: isTop,
            showBottom: () {
              showSheet();
            },
          )),
          GestureDetector(
            onTap: () {
              showSheet();
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0XFF171418)),
              height: 25,
              child: const Center(
                child: SizedBox(
                    width: 80, child: Divider(color: Colors.white, height: 2)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
