import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarProvider =
    NotifierProvider<BottomNavBarNotifier, int>(BottomNavBarNotifier.new);

class BottomNavBarNotifier extends Notifier<int> {
  BottomNavBarNotifier();

  @override
  int build() => 0;

  void setCurrentIndex(int index) {
    state = index;
  }
}
