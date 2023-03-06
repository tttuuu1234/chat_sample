import '../../importer.dart';
import '../enum/bottom_nav_bar_item.dart';

// GlobalKeyを最初Class内においていたが、それだとcurrentContextがnullになってしまったり
// ホットリロード時に画面遷移した画面が消えてBottomNavBarItemに設定している画面が表示されるという
// 事があり、開発に悪影響を及ぼすのでClassに依存させないよう外出しにした
final navigatorKeysProvider =
    Provider<Map<BottomNavBarItem, GlobalKey<NavigatorState>>>((ref) {
  return {
    BottomNavBarItem.home: GlobalKey<NavigatorState>(),
    BottomNavBarItem.userSearch: GlobalKey<NavigatorState>(),
    BottomNavBarItem.talkList: GlobalKey<NavigatorState>(),
    BottomNavBarItem.profile: GlobalKey<NavigatorState>(),
  };
});

final commonNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());

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
