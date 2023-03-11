import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  const flavor = String.fromEnvironment('flavor');
  print(flavor);
  runApp(const ProviderScope(child: App()));
}
