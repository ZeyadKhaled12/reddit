import 'package:flutter/material.dart';

class SettingsWidgetAlert {
  static AlertDialog alertDialog(BuildContext context,
          {required Function() fun}) =>
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0XFF141115).withOpacity(0.8),
        title: Column(
          children: [
            const Text('Are you sure',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Text(
              'You can\'t restore comments that have been deleted',
              style:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15),
            )
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white.withOpacity(0.2)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 15),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 6)),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0XFFEC0040)),
                child: TextButton(
                  onPressed: fun,
                  child: const Text(
                    'Delete',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
