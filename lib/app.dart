import 'package:chat_sample/importer.dart';
import 'package:chat_sample/ui/pages/root/page.dart';
import 'package:chat_sample/ui/services/navigator.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: ref.read(commonNavigatorKey),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootPage(),
    );
  }
}
