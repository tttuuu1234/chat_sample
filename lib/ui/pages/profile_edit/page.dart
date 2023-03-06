import 'package:chat_sample/ui/components/basic_layout/widget.dart';
import 'package:chat_sample/ui/styles/color.dart';
import 'package:chat_sample/ui/styles/padding.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../importer.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicLayout(
      title: 'プロフィール編集',
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('保存'),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('メインのプロフィール写真'),
            const SizedBox(
              height: 350,
              child: Placeholder(),
            ),
            const Text('あなたに関する写真を8枚まで追加できます。'),
            SizedBox(
              height: 64,
              width: 64,
              child: DottedBorder(
                color: AppColor.grey,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: AppColor.grey,
                  ),
                ),
              ),
            ),
            InputFiledBaseLayout(label: '名前', widget: TextFormField()),
            InputFiledBaseLayout(label: '性別', widget: TextFormField()),
            InputFiledBaseLayout(label: '年齢', widget: TextFormField()),
            InputFiledBaseLayout(label: '場所', widget: TextFormField()),
            InputFiledBaseLayout(label: '自己紹介', widget: TextFormField()),
          ],
        ),
      ),
    );
  }
}

class InputFiledBaseLayout extends StatelessWidget {
  const InputFiledBaseLayout({
    super.key,
    required this.label,
    required this.widget,
  });

  final String label;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: AppPadding.smallHorizontal,
          child: Row(
            children: [
              Text(label),
              Expanded(child: widget),
            ],
          ),
        ),
      ],
    );
  }
}
