import 'package:chat_sample/ui/pages/home.dart';
import 'package:chat_sample/ui/pages/profile.dart';
import 'package:chat_sample/ui/pages/talk_list.dart';
import 'package:chat_sample/ui/pages/user_search.dart';
import 'package:flutter/material.dart';

enum BottomNavBarItem {
  home(
    label: 'ホーム',
    iconData: Icons.home,
    body: HomePage(),
  ),
  userSearch(
    label: '探す',
    iconData: Icons.search,
    body: UserSearchPage(),
  ),
  talkList(
    label: 'トーク',
    iconData: Icons.chat,
    body: TalkListPage(),
  ),
  profile(
    label: 'プロフ',
    iconData: Icons.account_box,
    body: ProfilePage(),
  );

  const BottomNavBarItem({
    required this.label,
    required this.iconData,
    required this.body,
  });

  final String label;
  final IconData iconData;
  final Widget body;
}
