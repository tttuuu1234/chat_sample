import 'package:chat_sample/ui/enum/bottom_nav_bar_item.dart';
import 'package:chat_sample/ui/notifier/bottom_nav_bar/state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarProvider =
    StateNotifierProvider<BottomNavBarNotifier, BottomNavBarState>((ref) {
  return BottomNavBarNotifier();
});

class BottomNavBarNotifier extends StateNotifier<BottomNavBarState> {
  BottomNavBarNotifier() : super(BottomNavBarState());

  void setCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void setCurrentItem(BottomNavBarItem item) {
    state = state.copyWith(currentItem: item);
  }
}
