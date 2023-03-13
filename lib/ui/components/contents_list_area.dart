import '../../importer.dart';

class ContentsListArea extends StatelessWidget {
  const ContentsListArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        20,
        (index) => ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '翼',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '東京都・26歳',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const Text(
                '6秒前',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          subtitle: Column(
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.only(top: 16),
                color: Colors.blueAccent,
              ),
              AppVerticalMargin.small,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.favorite),
                      AppHorizontalMargin.xLarge,
                      const Icon(Icons.reply_rounded)
                    ],
                  ),
                  const Icon(Icons.more_vert_sharp),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
