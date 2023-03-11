import 'package:flutter/material.dart';

import '../enum/gender.dart';
import '../styles/color.dart';

class GenderSelectFiled extends StatelessWidget {
  const GenderSelectFiled({
    Key? key,
    required this.selectedGender,
  }) : super(key: key);

  final Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: const BoxConstraints(
        minWidth: 70,
        maxWidth: 80,
      ),
      borderRadius: BorderRadius.circular(16),
      color: AppColor.black,
      selectedColor: AppColor.black,
      fillColor: AppColor.green,
      isSelected: Gender.values.map((e) {
        if (e.value == selectedGender.value) {
          return true;
        }

        return false;
      }).toList(),
      onPressed: (index) {
        print(index);
      },
      children: Gender.values.map((e) => Text(e.label)).toList(),
    );
  }
}
