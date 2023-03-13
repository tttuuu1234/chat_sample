
import '../../../importer.dart';
import '../validator/validator.dart';

class ValidateInputFiled extends StatelessWidget {
  const ValidateInputFiled({
    Key? key,
    required this.controller,
    this.hintText,
    this.showCursor,
    this.readOnly = false,
    this.isDense = true,
    this.contentPadding,
    this.validateRules,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final bool? showCursor;
  final bool readOnly;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;
  final List<Validator>? validateRules;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.green,
      decoration: InputDecoration(
        isDense: isDense,
        contentPadding: contentPadding ?? AppPadding.zero,
        hintText: hintText,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      showCursor: showCursor,
      readOnly: readOnly,
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
      onTap: onTap,
    );
  }
}
