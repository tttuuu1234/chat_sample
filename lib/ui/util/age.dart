import '../../importer.dart';

final selectableAgeListProvider = Provider<List<Age>>((ref) {
  var list = [Age(label: '未選択', value: 0, index: 0)];
  for (var i = 13; i <= 80; i++) {
    list.add(Age(label: i.toString(), value: i, index: i - 12));
  }

  return list;
});

class Age {
  Age({required this.label, required this.value, required this.index});

  final String label;
  final int value;
  final int index;
}
