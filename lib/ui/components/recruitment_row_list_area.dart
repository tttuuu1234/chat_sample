import '../../importer.dart';

class RecruitmentRowListArea extends StatelessWidget {
  const RecruitmentRowListArea({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: Text(label),
        ),
        AppVerticalMargin.small,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              20,
              (index) => Container(
                margin: const EdgeInsets.only(left: 16),
                child: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
        ),
        AppVerticalMargin.small,
      ],
    );
  }
}
