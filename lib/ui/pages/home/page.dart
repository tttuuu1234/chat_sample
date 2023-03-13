import 'package:chat_sample/ui/components/basic_layout.dart';
import 'package:chat_sample/ui/components/line.dart';

import '../../../importer.dart';
import '../../components/contents_list_area.dart';
import '../../components/recruitment_row_list_area.dart';

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
            HomeTabBarView(
              recruitmentLabel: S.of(context).callingRoomLabel,
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

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({
    super.key,
    required this.recruitmentLabel,
  });

  final String recruitmentLabel;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.smallVertical,
          child: Column(
            children: [
              RecruitmentRowListArea(label: recruitmentLabel),
              const Line(),
              const ContentsListArea(),
            ],
          ),
        ),
      ),
    );
  }
}
