import 'package:chat_sample/generated/l10n.dart';
import 'package:chat_sample/ui/components/basic_layout.dart';
import 'package:chat_sample/ui/styles/color.dart';
import 'package:chat_sample/ui/styles/margin.dart';
import 'package:chat_sample/ui/styles/padding.dart';

import '../../../importer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: BasicLayout(
        title: S.of(context).homeTitle,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Padding(
                padding: AppPadding.smallHorizontal,
                child: const Text(
                  'ホーム',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Tab(
              icon: Padding(
                padding: AppPadding.smallHorizontal,
                child: const Text(
                  'フォロー中',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ],
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          indicatorSize: TabBarIndicatorSize.label,
        ),
        body: TabBarView(
          children: [
            Scrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppPadding.smallVertical,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            child: const Text('通話中のルーム'),
                          ),
                          AppVerticalMargin.small,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                20,
                                (index) => Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: const CircleAvatar(
                                    child: Icon(Icons.person),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AppVerticalMargin.small,
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: AppColor.grey,
                      ),
                      Column(
                        children: List.generate(
                          20,
                          (index) => ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '翼',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      '東京都・26歳',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const Text(
                                  '6秒前',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            leading: const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            subtitle: Column(
                              children: [
                                Container(
                                  height: 100,
                                  margin: const EdgeInsets.only(top: 16),
                                  color: Colors.blueAccent,
                                ),
                                AppVerticalMargin.small,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.favorite),
                                        AppHorizontalMargin.xLarge,
                                        Icon(Icons.reply_rounded)
                                      ],
                                    ),
                                    Icon(Icons.more_vert_sharp),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: const [],
            ),
          ],
        ),
      ),
    );
  }
}
