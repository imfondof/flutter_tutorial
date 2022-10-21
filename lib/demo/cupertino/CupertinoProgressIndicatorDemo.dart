import 'package:flutter/cupertino.dart';

//loading圆形加载提示
class CupertinoProgressIndicatorDemo extends StatelessWidget {
  const CupertinoProgressIndicatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle: Text(""),
        ),
        child: Center(
          child: CupertinoActivityIndicator(),
        ));
  }
}
