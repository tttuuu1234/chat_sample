import 'package:chat_sample/ui/enum/bottom_nav_bar_item.dart';
import 'package:chat_sample/ui/services/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifier/bottom_nav_bar/notifier.dart';

final _navigatoryKeys = {
  BottomNavBarItem.home: GlobalKey<NavigatorState>(),
  BottomNavBarItem.userSearch: GlobalKey<NavigatorState>(),
  BottomNavBarItem.talkList: GlobalKey<NavigatorState>(),
  BottomNavBarItem.profile: GlobalKey<NavigatorState>(),
};

class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bottomNavBarProvider);
    final notifier = ref.watch(bottomNavBarProvider.notifier);

    return Scaffold(
      body: Stack(
        children: BottomNavBarItem.values.map((item) {
          return Offstage(
            offstage: state.currentItem != item,
            child: Navigator(
              key: _navigatoryKeys[item],
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) {
                    return item.body;
                  },
                );
              },
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.currentIndex,
        onTap: (index) {
          if (index == state.currentIndex) {
            _navigatoryKeys[state.currentItem]
                ?.currentState
                ?.popUntil((route) => route.isFirst);
            return;
          }

          final selectedItem = BottomNavBarItem.values[index];
          notifier.setCurrentIndex(index);
          notifier.setCurrentItem(selectedItem);
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        items: BottomNavBarItem.values.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(e.iconData),
            label: e.label,
          );
        }).toList(),
      ),
    );
  }
}
