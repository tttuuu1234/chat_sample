import 'package:chat_sample/ui/components/basic_layout/widget.dart';
import 'package:chat_sample/ui/styles/size.dart';

import '../../../importer.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicLayout(
      title: 'プロフィール編集',
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('保存'),
        ),
      ],
      body: Column(
        children: [
          Text('メインのプロフィール写真'),
          SizedBox(
            // height: 200,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
