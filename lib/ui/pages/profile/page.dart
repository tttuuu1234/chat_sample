import 'package:chat_sample/ui/services/navigator.dart';
import 'package:chat_sample/ui/styles/color.dart';
import 'package:chat_sample/ui/styles/margin.dart';
import 'package:chat_sample/ui/styles/padding.dart';

import '../../../importer.dart';
import '../profile_edit/page.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Placeholder(),
            AppVerticalMargin.small,
            Padding(
              padding: AppPadding.smallHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('もふもふマン'),
                      const Icon(
                        Icons.warning_amber,
                        color: AppColor.yellow,
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          await NavigatorService.push(
                            context: context,
                            rootNavigator: true,
                            page: const ProfileEditPage(),
                            fullscreenDialog: true,
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            Text('編集する'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text('東京都'),
                  AppVerticalMargin.small,
                  const Text('いい整体教えてね'),
                  const Divider(),
                  Row(
                    children: [
                      Row(
                        children: const [
                          Text('0'),
                          Text('投稿'),
                        ],
                      ),
                      AppHorizontalMargin.small,
                      Row(
                        children: const [
                          Text('1'),
                          Text('フォロー'),
                        ],
                      ),
                      AppHorizontalMargin.small,
                      Row(
                        children: const [
                          Text('1'),
                          Text('フォロワー'),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
