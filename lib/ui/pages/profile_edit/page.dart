import 'package:chat_sample/ui/components/age_select_filed/widget.dart';
import 'package:chat_sample/ui/components/basic_layout/widget.dart';
import 'package:chat_sample/ui/enum/gender.dart';
import 'package:chat_sample/ui/styles/color.dart';
import 'package:chat_sample/ui/styles/margin.dart';
import 'package:chat_sample/ui/styles/padding.dart';
import 'package:chat_sample/ui/util/age.dart';
import 'package:chat_sample/ui/util/modal.dart';
import 'package:chat_sample/ui/util/prefecture.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../importer.dart';
import '../../components/gender_select_filed/widget.dart';
import '../../components/validate_input_field/widget.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectableAgeList = ref.watch(selectableAgeListProvider);
    final selectablePrefectureList =
        ref.watch(selectablePrefectureListProvider);
    final ageList =
        selectableAgeList.map((e) => Center(child: Text(e.label))).toList();
    final prefectureList = selectablePrefectureList
        .map((e) => Center(
              child: Text(e.label),
            ))
        .toList();

    return BasicLayout(
      title: 'プロフィール編集',
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            '保存',
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppVerticalMargin.small,
            Padding(
              padding: AppPadding.smallHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('メインのプロフィール写真'),
                  AppVerticalMargin.small,
                  const SizedBox(
                    height: 350,
                    child: Placeholder(),
                  ),
                  AppVerticalMargin.small,
                  const Text('あなたに関する写真を8枚まで追加できます。'),
                  AppVerticalMargin.small,
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
                  AppVerticalMargin.small,
                ],
              ),
            ),
            InputFiledBaseLayout(
              label: '名前',
              widget: ValidateInputFiled(
                controller: TextEditingController(),
              ),
            ),
            const InputFiledBaseLayout(
              label: '性別',
              widget: GenderSelectFiled(
                selectedGender: Gender.noSelect,
              ),
            ),
            InputFiledBaseLayout(
              label: '年齢',
              widget: SelectModalField(
                hintText: '年齢を追加',
                onTap: () async {
                  await ModalUtil.showSelectableModal(
                    context,
                    ageList,
                    (index) {
                      print(index);
                      final value = selectableAgeList
                          .firstWhere((element) => element.index == index)
                          .value;
                      print(value);
                    },
                    () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            InputFiledBaseLayout(
              label: '場所',
              widget: SelectModalField(
                hintText: '場所を追加',
                onTap: () async {
                  await ModalUtil.showSelectableModal(
                    context,
                    prefectureList,
                    (index) {
                      print(index);
                      final value = selectablePrefectureList
                          .firstWhere((element) => element.index == index)
                          .label;
                      print(value);
                    },
                    () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            InputFiledBaseLayout(label: '自己紹介', widget: TextFormField()),
            AppVerticalMargin.small,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(label),
              ),
              Expanded(flex: 3, child: widget)
            ],
          ),
        ),
      ],
    );
  }
}
