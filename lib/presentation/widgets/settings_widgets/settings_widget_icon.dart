import 'package:flutter/material.dart';

class SettingsWidgetIcon extends StatelessWidget {
  const SettingsWidgetIcon(
      {super.key,
      required this.iconData,
      required this.text,
      required this.onPressed});
  final IconData iconData;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.white,
                size: 25,
              ),
              const Padding(padding: EdgeInsets.only(right: 20)),
              Text(text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18))
            ],
          )),
    );
  }
}
