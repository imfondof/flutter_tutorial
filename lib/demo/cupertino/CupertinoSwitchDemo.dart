import 'package:flutter/cupertino.dart';

//开关按钮
class CupertinoSwitchDemo extends StatefulWidget {
  const CupertinoSwitchDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CupertinoSwitchDemoState();
  }
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo> with RestorationMixin {
  final RestorableBool _switchValueA = RestorableBool(false);

  @override
  String? get restorationId => 'cupertino_switch_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_switchValueA, 'switch_valueA');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle: Text(
            "demoSelectionControlsSwitchTitle",
          ),
        ),
        child: Center(
          child: Semantics(
            container: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoSwitch(
                        value: _switchValueA.value,
                        onChanged: (value) {
                          setState(() {
                            _switchValueA.value = value;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoSwitch(value: _switchValueA.value, onChanged: null),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
