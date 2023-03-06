import 'package:chat_sample/ui/components/basic_layout/widget.dart';
import 'package:chat_sample/ui/enum/gender.dart';
import 'package:chat_sample/ui/styles/color.dart';
import 'package:chat_sample/ui/styles/margin.dart';
import 'package:chat_sample/ui/styles/padding.dart';
import 'package:chat_sample/ui/validator/validator.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../importer.dart';
import '../../components/gender_select_filed/widget.dart';

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
            InputFiledBaseLayout(label: '年齢', widget: TextFormField()),
            InputFiledBaseLayout(label: '場所', widget: TextFormField()),
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

class ValidateInputFiled extends StatelessWidget {
  const ValidateInputFiled({
    Key? key,
    required this.controller,
    this.validateRules,
  }) : super(key: key);

  final TextEditingController controller;
  final List<Validator>? validateRules;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.green,
      decoration: const InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        String? errorMessage;
        final rules = validateRules;
        if (rules == null) {
          return null;
        }

        for (final rule in rules) {
          if (rule.validate(value)) {
            errorMessage = rule.getMessage();
            break;
          }
        }

        return errorMessage;
      },
    );
  }
}
