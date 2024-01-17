import 'package:reddit/core/utils/assets_manager.dart';
import 'package:reddit/domain/entities/post/post.dart';
import 'package:reddit/domain/entities/post/reply.dart';

import '../domain/entities/user.dart';

class DummyData {
  static Post post = Post(
      postText:
          'After a year of collecting parts for this build, I Present my finished heavy-9(Thocky typing test at the end)',
      up: 268,
      down: 19,
      videoUrl: VideoAssets.textVideo,
      user: const User(
          backgroundUrl:
              'https://mohammedward.bsite.net/Banners/Article_020240107160115.jpg',
          name: 'Xury46'),
      replies: [
        Reply(
            user: const User(
                backgroundUrl:
                    'https://mohammedward.bsite.net/Banners/Article_020240107160115.jpg',
                name: 'Ahmed'),
            replyText:
                'generator based on a new seed generated internally which only has 32 bit of random. This makes it',
            dateTime: DateTime.now().add(const Duration(days: -1)),
            up: 12,
            down: 14,
            replies: [
              Reply(
                  user: const User(
                      backgroundUrl:
                          'https://mohammedward.bsite.net/Banners/Article_020240107160115.jpg',
                      name: 'Omar'),
                  replyText:
                      'generator based on a new seed generated internally which only has 32 bit of random. This makes it',
                  dateTime: DateTime.now().add(const Duration(days: -1)),
                  up: 12,
                  down: 14,
                  replies: const [])
            ]),
        Reply(
            user: const User(
                backgroundUrl:
                    'https://mohammedward.bsite.net/Banners/Article_020240107160115.jpg',
                name: 'Sayed'),
            replyText:
                'generator based on a new seed generated internally which only has 32 bit of random. This makes it',
            dateTime: DateTime.now().add(const Duration(days: -1)),
            up: 9,
            down: 19,
            replies: const []),
        Reply(
            user: const User(
                backgroundUrl:
                    'https://mohammedward.bsite.net/Banners/Article_020240107160115.jpg',
                name: 'Hussin'),
            replyText:
                'generator based on a new seed generated internally which only has 32 bit of random. This makes it',
            dateTime: DateTime.now().add(const Duration(days: -1)),
            up: 2,
            down: 8,
            replies: const []),
        Reply(
            user: const User(
                backgroundUrl:
                    'https://mohammedward.bsite.net/Banners/Article_020240107160115.jpg',
                name: 'Hesho'),
            replyText:
                'generator based on a new seed generated internally which only has 32 bit of random. This makes it',
            dateTime: DateTime.now().add(const Duration(days: -1)),
            up: 66,
            down: 2,
            replies: [
              Reply(
                  user: const User(
                      backgroundUrl:
                          'https://mohammedward.bsite.net/Banners/Article_020240107160115.jpg',
                      name: 'Hesho'),
                  replyText:
                      'generator based on a new seed generated internally which only has 32 bit of random. This makes it',
                  dateTime: DateTime.now().add(const Duration(days: -1)),
                  up: 20,
                  down: 8,
                  replies: const [])
            ])
      ]);
}
