import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  Size get getSize => MediaQuery.of(this).size;
  double get getHeight => getSize.height;
  double get getWidth => getSize.width;
}
