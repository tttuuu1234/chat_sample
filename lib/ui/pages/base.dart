import 'package:chat_sample/ui/enum/bottom_nav_bar_item.dart';
import 'package:chat_sample/ui/notifier/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bottomNavBarProvider);
    final notifier = ref.watch(bottomNavBarProvider.notifier);
    final navigatoryKeys = {
      BottomNavBarItem.home: GlobalKey<NavigatorState>(),
      BottomNavBarItem.userSearch: GlobalKey<NavigatorState>(),
      BottomNavBarItem.talkList: GlobalKey<NavigatorState>(),
      BottomNavBarItem.profile: GlobalKey<NavigatorState>(),
    };

    return Scaffold(
      body: Stack(
        children: BottomNavBarItem.values.map((item) {
          return Offstage(
            offstage: item.index != state,
            child: Navigator(
              key: navigatoryKeys[item],
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
        currentIndex: state,
        onTap: (index) {
          final currentBottomNavBarItem = BottomNavBarItem.values[index];
          if (state == currentBottomNavBarItem.index) {
            navigatoryKeys[currentBottomNavBarItem]
                ?.currentState
                ?.popUntil((route) => route.isFirst);
            return;
          }

          notifier.setCurrentIndex(index);
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
