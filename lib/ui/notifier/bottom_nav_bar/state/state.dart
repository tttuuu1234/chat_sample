import 'package:chat_sample/ui/enum/bottom_nav_bar_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class BottomNavBarState with _$BottomNavBarState {
  factory BottomNavBarState({
    @Default(0) int currentIndex,
    @Default(BottomNavBarItem.home) BottomNavBarItem currentItem,
  }) = _BottomNavBarState;

  BottomNavBarState._();
}
