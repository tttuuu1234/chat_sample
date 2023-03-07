import 'package:chat_sample/ui/extension/context.dart';
import 'package:chat_sample/ui/styles/color.dart';
import 'package:flutter/cupertino.dart';

import '../../../importer.dart';
import '../../util/age.dart';
import '../validate_input_field/widget.dart';

class AgeSelectField extends ConsumerWidget {
  const AgeSelectField({
    Key? key,
    this.hintText,
  }) : super(key: key);

  final String? hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectableAgeList = ref.watch(selectableAgeListProvider);

    return ValidateInputFiled(
      controller: TextEditingController(),
      hintText: hintText,
      readOnly: true,
      showCursor: true,
      onTap: () {
        _showModalPicker(context, selectableAgeList);
      },
    );
  }

  Future<void> _showModalPicker(BuildContext context, List<Age> ageList) async {
    await showModalBottomSheet<void>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            SizedBox(
              height: context.getHeight / 3,
              child: CupertinoPicker(
                itemExtent: 36,
                onSelectedItemChanged: (value) {
                  print('選択！');
                  print(value);
                  final a = ageList
                      .firstWhere((element) => element.index == value)
                      .value;
                  print(a);
                },
                children: ageList
                    .map(
                      (e) => Center(child: Text(e.label)),
                    )
                    .toList(),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              color: AppColor.black,
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: () {
                  print('押した');
                  Navigator.pop(context);
                },
                child: const Text(
                  '完了',
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
