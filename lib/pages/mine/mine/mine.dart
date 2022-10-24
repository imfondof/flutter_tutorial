import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  const Mine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的"),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Text("A"),
            Text("B"),
            Text("C"),
          ],
        ),
      ),
    );
  }
}