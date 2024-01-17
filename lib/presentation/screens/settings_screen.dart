import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/domain/usecases/delete_reply_uc.dart';
import 'package:reddit/presentation/controller/bloc/post_bloc.dart';

import '../widgets/settings_widgets/settings_widget_alert.dart';
import '../widgets/settings_widgets/settings_widget_icon.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen(
      {super.key,
      required this.post,
      required this.index,
      required this.subIndex});
  final Post post;
  final int index;
  final int subIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: [
          SettingsWidgetIcon(
              iconData: Icons.share, text: 'Share', onPressed: () {}),
          SettingsWidgetIcon(
              iconData: Icons.save_outlined, text: 'Save', onPressed: () {}),
          SettingsWidgetIcon(
              iconData: Icons.notifications_outlined,
              text: 'Notifications',
              onPressed: () {}),
          SettingsWidgetIcon(
              iconData: Icons.copy_outlined,
              text: 'Copy text',
              onPressed: () {}),
          SettingsWidgetIcon(
              iconData: Icons.markunread_mailbox_outlined,
              text: 'Collapse',
              onPressed: () {}),
          SettingsWidgetIcon(
              iconData: Icons.edit, text: 'Edit', onPressed: () {}),
          SettingsWidgetIcon(
              iconData: Icons.delete_outline,
              text: 'Delete',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SettingsWidgetAlert.alertDialog(
                    context,
                    fun: () {
                      context.read<PostBloc>().add(DeleteReplyEvent(
                          deleteReplyParameters: DeleteReplyParameters(
                              post: post, index: index, subIndex: subIndex)));
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
