import 'package:chat_sample/providers/master.dart';
import 'package:chat_sample/ui/components/multi_input_field.dart';
import 'package:chat_sample/ui/enum/gender.dart';
import 'package:chat_sample/ui/util/modal.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../importer.dart';
import '../../components/basic_layout.dart';
import '../../components/gender_select_field.dart';
import '../../components/show_modal_filed.dart';
import '../../components/validate_input_filed.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectableAgeList = ref.watch(selectabeAgeListProvider);
    final selectablePrefectureList = ref.watch(
      selectablePrefectureListProvider,
    );
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
            const GenderSelectFiledBaseLayout(
              label: '性別',
              widget: GenderSelectFiled(
                selectedGender: Gender.noSelect,
              ),
            ),
            InputFiledBaseLayout(
              label: '年齢',
              widget: ShowModalField(
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
              widget: ShowModalField(
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
            MultiInputFiledBaseLayout(
              label: '自己紹介',
              widget: MultiInputFiled(
                controller: TextEditingController(),
              ),
            ),
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
        const Divider(height: 1),
        AppVerticalMargin.xSmall,
        Padding(
          padding: AppPadding.smallHorizontal,
          child: Row(
            children: [
              Expanded(child: Text(label)),
              Expanded(flex: 3, child: widget)
            ],
          ),
        ),
        AppVerticalMargin.xSmall,
      ],
    );
  }
}

class GenderSelectFiledBaseLayout extends StatelessWidget {
  const GenderSelectFiledBaseLayout({
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
        const Divider(height: 1),
        Padding(
          padding: AppPadding.smallHorizontal,
          child: Row(
            children: [
              Expanded(child: Text(label)),
              Expanded(flex: 3, child: widget),
            ],
          ),
        ),
      ],
    );
  }
}

class MultiInputFiledBaseLayout extends StatelessWidget {
  const MultiInputFiledBaseLayout({
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
        const Divider(height: 1),
        AppVerticalMargin.xSmall,
        Padding(
          padding: AppPadding.smallHorizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(label)),
              Expanded(flex: 3, child: widget)
            ],
          ),
        ),
      ],
    );
  }
}
