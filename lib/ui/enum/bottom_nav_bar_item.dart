import 'package:flutter/material.dart';

import '../pages/home/page.dart';
import '../pages/profile/page.dart';
import '../pages/talk_list/page.dart';
import '../pages/user_search/page.dart';

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
