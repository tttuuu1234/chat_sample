import 'package:chat_sample/data/master/age.dart';
import 'package:chat_sample/data/master/prefecture.dart';

import '../importer.dart';

final selectabeAgeListProvider = Provider<List<Age>>((ref) {
  return AgeMaster.getSelectableList();
});

final selectablePrefectureListProvider = Provider<List<Prefecture>>((ref) {
  return PrefectureMaster.getSelectableList();
});