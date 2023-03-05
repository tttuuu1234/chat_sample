import '../../importer.dart';
import '../enum/bottom_nav_bar_item.dart';

final navigatorKeysProvider =
    Provider<Map<BottomNavBarItem, GlobalKey<NavigatorState>>>((ref) {
  return {
    BottomNavBarItem.home: GlobalKey<NavigatorState>(),
    BottomNavBarItem.userSearch: GlobalKey<NavigatorState>(),
    BottomNavBarItem.talkList: GlobalKey<NavigatorState>(),
    BottomNavBarItem.profile: GlobalKey<NavigatorState>(),
  };
});

class NavigatorService {
  NavigatorService._();

  static Future<void> push<T>({
    required BuildContext context,
    required Widget page,
    bool rootNavigator = false,
    bool fullscreenDialog = false,
  }) async {
    await Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }
}
