import 'package:flutter/material.dart';

class RepliesWidgetTextField extends StatefulWidget {
  const RepliesWidgetTextField(
      {super.key, required this.controller, required this.sendMessage});
  final TextEditingController controller;
  final Function() sendMessage;

  @override
  State<RepliesWidgetTextField> createState() => _RepliesWidgetTextFieldState();
}

class _RepliesWidgetTextFieldState extends State<RepliesWidgetTextField> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8)),
            child: TextField(
              controller: widget.controller,
              onTap: () {
                setState(() {
                  isClick = true;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  isClick = false;
                });
              },
              cursorColor: Colors.white,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 15, right: 15),
                  suffixIcon: isClick
                      ? null
                      : Icon(
                          Icons.image_outlined,
                          color: Colors.white.withOpacity(0.5),
                          size: 25,
                        ),
                  border: InputBorder.none,
                  hintText: 'Add a comment',
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          if (isClick)
            Bottom(
              sendFun: widget.sendMessage,
            )
        ],
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({super.key, required this.sendFun});
  final Function() sendFun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.link,
                color: Colors.white.withOpacity(0.5),
                size: 25,
              ),
              const Padding(padding: EdgeInsets.only(right: 10)),
              Icon(
                Icons.image_outlined,
                color: Colors.white.withOpacity(0.5),
                size: 25,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffAFBCF9)),
            child: TextButton(
                onPressed: sendFun,
                child: const Text('Reply',
                    style: TextStyle(color: Colors.white, fontSize: 18))),
          )
        ],
      ),
    );
  }
}
