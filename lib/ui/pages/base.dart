import 'package:chat_sample/ui/notifier/bottom_nav_bar.dart';
import 'package:chat_sample/ui/pages/home.dart';
import 'package:chat_sample/ui/pages/profile.dart';
import 'package:chat_sample/ui/pages/talk_list.dart';
import 'package:chat_sample/ui/pages/user_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagesList = [
      {'title': 'ホーム', 'body': const HomePage()},
      {'title': '探す', 'body': const UserSearchPage()},
      {'title': 'トーク', 'body': const TalkListPage()},
      {'title': 'プロフ', 'body': const ProfilePage()},
    ];
    final state = ref.watch(bottomNavBarProvider);
    final notifier = ref.watch(bottomNavBarProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pagesList[state]['title'].toString(),
        ),
      ),
      body: pagesList[state]['body'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state,
        onTap: (value) {
          notifier.setCurrentIndex(value);
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: '探す',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            activeIcon: Icon(Icons.chat),
            label: 'トーク',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            activeIcon: Icon(Icons.account_box),
            label: 'プロフ',
          ),
        ],
      ),
    );
  }
}
