import 'package:chat_sample/ui/notifier/bottom_nav_bar/notifier.dart';

import '../../importer.dart';
import '../enum/bottom_nav_bar_item.dart';

class NavigatorService {
  NavigatorService._();

  // final WidgetRef ref;
  // final navigatoryKeys = {
  //   BottomNavBarItem.home: GlobalKey<NavigatorState>(),
  //   BottomNavBarItem.userSearch: GlobalKey<NavigatorState>(),
  //   BottomNavBarItem.talkList: GlobalKey<NavigatorState>(),
  //   BottomNavBarItem.profile: GlobalKey<NavigatorState>(),
  // };

  static Future<void> push<T>({
    required BuildContext context,
    required Widget page,
    bool rootNavigator = false,
    bool fullscreenDialog = false,
  }) async {
    // final currentItem = ref.read(bottomNavBarProvider).currentItem;
    // final key = navigatoryKeys[currentItem]!;
    // print('key?????');
    // print(key);
    // print(key.currentContext);
    await Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }
}
