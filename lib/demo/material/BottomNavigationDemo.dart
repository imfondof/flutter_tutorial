import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../../pages/index/index/index.dart';
import '../../pages/index/mine/mine.dart';

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({super.key, required this.restorationId});

  final String restorationId;

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationDemoState();
  }
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bodys = <Widget>[const Index(), const Mine(), const Mine()];

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.add_comment), label: "注释"),
      const BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "日历"),
      const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "我的"),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("常驻标签页"),
      ),
      body: Center(
        child: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: bodys[_currentIndex.value]
            // child: _NavigationDestinationView(
            //   key: UniqueKey(),
            //   item: bottomNavigationBarItems[_currentIndex.value],
            // ),
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex.value,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        backgroundColor: colorScheme.primary,
      ),
    );
  }

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({super.key, required this.item});

  final BottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExcludeSemantics(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  "assets/imgs/bottom_navigation_background.png",
                ),
              ),
            ),
          ),
        ),
        Center(
          child: IconTheme(
            data: const IconThemeData(
              color: Colors.white,
              size: 80,
            ),
            child: Semantics(
              label: "",
              child: item.icon,
            ),
          ),
        )
      ],
    );
  }
}
