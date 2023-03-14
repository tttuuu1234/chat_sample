import 'package:chat_sample/ui/components/basic_layout.dart';

import '../../../importer.dart';
import '../../components/contents_list_area.dart';
import '../../components/line.dart';
import '../../components/recruitment_row_list_area.dart';

class UserSearchPage extends ConsumerWidget {
  const UserSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicLayout(
      title: S.of(context).userSearchTitle,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.apps),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.smallVertical,
            child: Column(
              children: [
                RecruitmentRowListArea(
                  label: S.of(context).talkRecruitmentLabel,
                ),
                const Line(),
                const ContentsListArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
