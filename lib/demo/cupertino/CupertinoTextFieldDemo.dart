import 'package:flutter/cupertino.dart';

//文本内容
class CupertinoTextFieldDemo extends StatelessWidget {
  const CupertinoTextFieldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle: Text("文本"),
        ),
        child: SafeArea(
          child: ListView(
            restorationId: "list_view",
            padding: const EdgeInsets.all(16),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoTextField(
                  restorationId: "email_address_text_field",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  autocorrect: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoTextField(
                  enabled: true,
                  textInputAction: TextInputAction.next,
                  restorationId: 'login_password_text_field_disabled',
                  placeholder: "密码",
                  clearButtonMode: OverlayVisibilityMode.editing,
                  obscureText: true,
                  autocorrect: false,
                ),
              ),
            ],
          ),
        ));
  }
}
