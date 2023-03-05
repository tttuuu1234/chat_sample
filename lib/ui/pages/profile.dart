import '../../importer.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text('もふもふマン'),
                Icon(Icons.dangerous),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
