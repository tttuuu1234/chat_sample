import 'package:chat_sample/generated/l10n.dart';
import 'package:chat_sample/ui/components/basic_layout.dart';

import '../../../importer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicLayout(
      title: S.of(context).homeTitle,
      body: Column(),
    );
  }
}
