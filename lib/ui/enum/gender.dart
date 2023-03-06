enum Gender {
  man(label: '男性', value: 1),
  woman(label: '女性', value: 2),
  noSelect(label: '未選択', value: 3);

  const Gender({required this.label, required this.value});

  final String label;
  final int value;
}
