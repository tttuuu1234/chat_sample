import 'package:chat_sample/importer.dart';
import 'package:chat_sample/ui/pages/root/page.dart';
import 'package:chat_sample/ui/services/navigator.dart';
import 'package:chat_sample/ui/styles/color.dart';
import 'package:chat_sample/ui/styles/size.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: ref.read(commonNavigatorKey),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.green,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.green,
          unselectedItemColor: AppColor.grey,
        ),
        textTheme: const TextTheme().copyWith(
            // bodySmall: TextStyle(fontSize: AppSize.xSmall),
            // bodyMedium: TextStyle(fontSize: AppSize.small),
            // bodyLarge: TextStyle(fontSize: AppSize.miduam),
            ),
        buttonTheme: const ButtonThemeData().copyWith(
          splashColor: Colors.amber,
          highlightColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
          ),
        ),
        scaffoldBackgroundColor: AppColor.white,
      ),
      home: const RootPage(),
    );
  }
}
