
import '../../../importer.dart';

class MultiInputFiled extends StatelessWidget {
  const MultiInputFiled({
    Key? key,
    required this.controller,
    this.hintText,
    this.contentPadding,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.green,
      maxLines: 8,
      maxLength: 255,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? AppPadding.zero,
        hintText: hintText,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
