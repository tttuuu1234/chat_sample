import 'package:flutter/cupertino.dart';

import '../../../importer.dart';
import 'validate_input_filed.dart';

class ShowModalField extends StatelessWidget {
  const ShowModalField({
    Key? key,
    this.hintText,
    this.onTap,
  }) : super(key: key);

  final String? hintText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ValidateInputFiled(
      controller: TextEditingController(),
      hintText: hintText,
      readOnly: true,
      showCursor: true,
      onTap: onTap,
    );
  }
}
