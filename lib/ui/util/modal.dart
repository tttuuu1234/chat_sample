import 'package:chat_sample/ui/extension/context.dart';
import 'package:flutter/cupertino.dart';

import '../../importer.dart';

class ModalUtil {
  ModalUtil._();

  static Future<void> showSelectableModal(
    BuildContext context,
    List<Widget> children,
    void Function(int index) onSelectedItemChanged,
    VoidCallback onPressed,
  ) async {
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
                onSelectedItemChanged: onSelectedItemChanged,
                children: children,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              color: AppColor.black,
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: onPressed,
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
