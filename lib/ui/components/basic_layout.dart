import '../../../importer.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({
    Key? key,
    required this.title,
    required this.body,
    this.isShowAppBar = true,
    this.leading,
    this.actions,
    this.bottom,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final Widget body;
  final bool isShowAppBar;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isShowAppBar
          ? AppBar(
              title: Text(title),
              actions: actions,
              leading: leading,
              bottom: bottom,
            )
          : null,
      body: SafeArea(child: body),
    );
  }
}
